macroScript GetMaterials
category:"DrunkenMaster"
tooltip:"Get materials"
buttontext:"GetMats"

(
fn PolyMatToID node1 = if classof node1 == Editable_Poly do
 	(	
 		faceSel = polyop.getFaceSelection node1
 		
 		if faceSel.numberset == 1 then
 		(
				faceMat = polyop.getFaceMatID node1 (faceSel as array)[1]
				
					if classOf node1.material == multiSubMaterial then (
						
						undo off(
						sme.DeleteView (sme.GetViewByName "TEMP") false
						NewView = sme.GetView(sme.CreateView "TEMP")
						
						
							NewView.CreateNode node1.material[faceMat][0,0]
						
						
						actionMan.executeAction 369891408 "40060"
						sleep 0.1
						sme.Open()
						)
					)
					else(
						undo off(
					
						sme.DeleteView (sme.GetViewByName "TEMP") false
						NewView = sme.GetView(sme.CreateView "TEMP")
						
						
							NewView.CreateNode node1.material[0,0]
						
						
						actionMan.executeAction 369891408 "40060"
						sleep 0.1
						sme.Open()
						)
					)
					
		)else(
				messageBox "Select one poligon only !"	
			)
 	)
	
	fn SelectAllMatsInSel = (
		
		if (selection.count > 0) then(
			undo off(
			
			
			sme.DeleteView (sme.GetViewByName "TEMP") false
			NewView = sme.GetView(sme.CreateView "TEMP")
		
			for obj in selection do
			(
				NewView.CreateNode obj.material[0,0]
			)
			
			actionMan.executeAction 369891408 "40060"
			sleep 0.1
			sme.Open()
		)
		)
		else(
		messagebox "You must have at least one object selected!"
		)
		
		)
		
	
	
	if subObjectLevel == 4 then (
		
		PolyMatToID $
	)
	else(
	
		SelectAllMatsInSel()
	)
)