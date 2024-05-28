Return-Path: <linux-omap+bounces-1411-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 210708D220E
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 18:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A054B256E8
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 16:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A634E173342;
	Tue, 28 May 2024 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="hlfmK2CQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7FE171E44;
	Tue, 28 May 2024 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716915323; cv=none; b=fQKH9wOHmSmr+huZUjHQtN0hDj+Ok3mBG5HoFYwVaIQVhEZBV09/cJBC4nrXxT7G6pF8XlgPqr8M6xnvOf34UDlCBcuahHzDv20tiDqJqpxo6BMAr0ZTIppqvV3nQ0nteA2nAE7c4rECrMzVo6+Advp6o5hq0HOEmp/QbgZ1fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716915323; c=relaxed/simple;
	bh=QTxQ+KHPr0EDOFlIej0x5u8bmSGipIXPXz/48kBneg8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEnj9t/ZjYWD4KOUqv16aBlTfpUd6SEYSOWREqvYAOL+fAihwEHwEgIBqd7M45qApAZllsyAAj1bijx6ryykaO1V1HQBBHYDkRcP9rwprTmB1/O6DMDYO/eherHGQzOKb/yk9E7IuW62FxUp6a7Mg8nwD/cKNShLepknxJ/j2Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=hlfmK2CQ; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sC06X-0089ZJ-0Y;
	Tue, 28 May 2024 18:55:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L/syQcTorpUvNP3M9H72T3wos4LokP55wd4BKC6Cqm8=; b=hlfmK2CQ5oPniJlLLKKS5UwnQN
	QadYmdcakwyT8UPskASp3qwypZTZHLomFDkJMAR1/fEYcTmvho+yGACR5Knrh4vitxoN0O1D4dYKG
	wesgZCWo7WaAr6Xn8rGdDXga61xbu+O24Fssse0xMmcB/4lR4bveaPZ1qwTa2VcrwvVx8PbqSnU/6
	laAExU16tvVbv5L2aHSeCeFTwmmIb/8wdeAQ0jtUHm9M7UMGVtqPl7v83CsoFKzmbUjYH69MW/3sS
	FWvz2X+bmU+wwsoDdjjlp93Et1ve++vH3+IYPx8Ya9C8y5UyGQVIqIedfeXOaDuMsjvGAFJ+4pZDO
	MuwIUtPQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sC06U-001uJT-38;
	Tue, 28 May 2024 18:55:16 +0200
Date: Tue, 28 May 2024 18:55:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240528185513.04c87e49@aktux>
In-Reply-To: <20240528-mandarin-chevron-130406a65434@spud>
References: <20240528065756.1962482-1-andreas@kemnade.info>
	<e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
	<20240528131622.4b4f8d03@aktux>
	<f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
	<20240528150647.40385d08@aktux>
	<3a29c775-4131-4047-9777-4146e6c8eed0@kernel.org>
	<20240528-unimpeded-dealing-0128abb54272@spud>
	<20240528174849.6945343a@aktux>
	<20240528-mandarin-chevron-130406a65434@spud>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 May 2024 16:53:46 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Tue, May 28, 2024 at 05:48:49PM +0200, Andreas Kemnade wrote:
> > On Tue, 28 May 2024 15:36:40 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >   
> > > On Tue, May 28, 2024 at 03:54:05PM +0200, Krzysztof Kozlowski wrote:  
> > > > On 28/05/2024 15:06, Andreas Kemnade wrote:    
> > > > > On Tue, 28 May 2024 13:25:29 +0200
> > > > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > >     
> > > > >> On 28/05/2024 13:16, Andreas Kemnade wrote:    
> > > > >>> On Tue, 28 May 2024 12:04:22 +0200
> > > > >>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > >>>       
> > > > >>>> On 28/05/2024 08:57, Andreas Kemnade wrote:      
> > > > >>>>> Convert the regulator bindings to yaml files. To allow only the regulator
> > > > >>>>> compatible corresponding to the toplevel mfd compatible, split the file
> > > > >>>>> into one per device.
> > > > >>>>>
> > > > >>>>> To not need to allow any subnode name, specify clearly node names
> > > > >>>>> for all the regulators.
> > > > >>>>>
> > > > >>>>> Drop one twl5030 compatible due to no documentation on mfd side and no
> > > > >>>>> users of the twl5030.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > >>>>> ---
> > > > >>>>> Reason for being RFC:
> > > > >>>>> the integration into ti,twl.yaml seems not to work as expected
> > > > >>>>> make dt_binding_check crashes without any clear error message
> > > > >>>>> if used on the ti,twl.yaml
> > > > >>>>>
> > > > >>>>>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
> > > > >>>>>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
> > > > >>>>>  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
> > > > >>>>>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
> > > > >>>>>  .../bindings/regulator/twl-regulator.txt      |  80 ----
> > > > >>>>>  5 files changed, 935 insertions(+), 81 deletions(-)
> > > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> > > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
> > > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
> > > > >>>>>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
> > > > >>>>>
> > > > >>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > > >>>>> index c2357fecb56cc..4ced6e471d338 100644
> > > > >>>>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > > >>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > > >>>>> @@ -50,7 +50,7 @@ allOf:
> > > > >>>>>            properties:
> > > > >>>>>              compatible:
> > > > >>>>>                const: ti,twl4030-wdt
> > > > >>>>> -
> > > > >>>>> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml        
> > > > >>>>
> > > > >>>> That's not needed, just like othehr refs below.
> > > > >>>>      
> > > > >>> but how to prevent error messages like this:
> > > > >>>
> > > > >>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-vaux1', 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-vdac', 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regulator-vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regulator-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'regulator-vusb1v8', 'regulator-vusb3v1
> > > > >>>
> > > > >>> esp. the regulator parts without adding stuff to ti,twl.yaml?      
> > > > >>
> > > > >> Eh? That's a watchdog, not regulator. Why do you add ref to regulator?
> > > > >>    
> > > > > hmm, wrongly indented? At what level doet it belong? But as the regualor.yaml stuff can
> > > > > be shortened, maybe just add it directly to ti,twl.yaml to avoid that trouble.    
> > > > 
> > > > I don't follow. The diff here and in other two places suggest you add
> > > > twl-regulator reference to wdt/gpio/whatnot nodes, not to regulators.    
> > > 
> > > The diff may look like that, but I think they're just trying to add it
> > > as a subnode of the pmic. There are other nodes, like the madc that do
> > > this in the same file:
> > >         madc:
> > >           type: object
> > >           $ref: /schemas/iio/adc/ti,twl4030-madc.yaml
> > >           unevaluatedProperties: false
> > > 
> > > I guess this is what was being attempted, albeit incorrectly.  
> > 
> > correct. No regulators node, just everything directly as a subnode of
> > the pmic. Well, I have now something using patternProperties directly itn ti,twl.yaml
> > including a more detailed example which does not upset dt_binding_check.
> > I am running dtbs_check to check if anything is odd. the 4030 variant seems
> > to be ok, waiting for some dtbs containing 603X now.
> > 
> > But somehow I would feel better if I would understand what was syntactically
> > wrong with my original proposal. I have totally no idea yet.  
> 
> If you want to create a child node, you can't just reference another
> schema willy nilly. You need to create a property of type object, as was
> done elsewhere in the file.
> 
hmm, by $ref regulator.yaml I can successfully create the child node
regulator-state-mem, so what is the difference to creating e.g. a child
node named regulator-vaux1 by $ref ti,twl4030-regulator.yaml

still a bit confused.

> > The error message of dt_binding_check is also meaningless:
> >  CHKDT   Documentation/devicetree/bindings
> > Traceback (most recent call last):
> >   File "/home/andi/.local/bin/dt-doc-validate", line 64, in <module>
> >     ret |= check_doc(f)
> >            ^^^^^^^^^^^^
> >   File "/home/andi/.local/bin/dt-doc-validate", line 32, in check_doc
> >     for error in sorted(dtsch.iter_errors(), key=lambda e: e.linecol):
> >                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/andi/.local/pipx/venvs/dtschema/lib/python3.11/site-packages/dtschema/schema.py", line 125, in iter_errors
> >     self.annotate_error(scherr, meta_schema, scherr.schema_path)
> >   File "/home/andi/.local/pipx/venvs/dtschema/lib/python3.11/site-packages/dtschema/schema.py", line 104, in annotate_error
> >     schema = schema[p]
> >              ~~~~~~^^^
> > KeyError: 'type'
> >   LINT    Documentation/devicetree/bindings
> > 
> > IMHO this should be improved.  
> 
> What I see with your patch applied is:
> /stuff/linux-dt/Documentation/devicetree/bindings/mfd/ti,twl.yaml: ignoring, error in schema: allOf: 0: then: properties: $ref
> 
> Not a great error either, but not a crash like you see. What version of
> dt-schema are you using?

2023.9
ok, but there is 2024.4... Upgraded and got your error

Regards,
Andreas

