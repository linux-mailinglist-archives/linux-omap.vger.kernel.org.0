Return-Path: <linux-omap+bounces-2979-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA0A01644
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2CD3A3E32
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAF01D14E2;
	Sat,  4 Jan 2025 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="5HvuRxFs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF321E507;
	Sat,  4 Jan 2025 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014830; cv=none; b=K3+ZTbU6HOUs+lsuPTjzfxS6ncdwV1hxNFqi+08dXx+byDc9EtmpwbufWQUnnwZwyAOBMb7KNP5LMUPJ8OHN6M4LgR9L6EYn/0KWCMhIu9Op77UY042Mmp4kAn1AaceV7Vyvcli4azHRdEQ3oXDlRfdU07xoVYJLBR1zBEUGc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014830; c=relaxed/simple;
	bh=MuAfWqxG9yST7ohqHtpTdQy8qyEZ1NJLdZB5N8FRWMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpjOUDVhw2KuxYKMmI63fuWrsmDEtJpCS2D4EOrbV5X0I9P1ZTV7c2wtl3K1nvLdvzxETI+no0CnaxzYwDyCJTXN6fhDJ6LNO4poxoHPOVhMWSV4OYxVR++5iIJ6/QwV8Z+V7okQfXqdCslRTUvgwN1hLWQ2luQW9UeZrL661tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=5HvuRxFs; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Q/KrZ6AFUTQT3QtE5lR+wWeof3/i19a4RobeBZWia6o=; b=5HvuRxFsw5rRk6Ospb4hd7MG0Y
	9/itHi2b1n7gtQAo9f5JldCiIg+woITVjcLc6tKLLxGSzhnxG9Q0b8S8gJ+HS2385xyNVnASToxJm
	Hc/p0/6z1ZYWDaEwvFOF52j6Vv3rabrcN0d/A5wWal9evm5GB/nOJv7cbBrsNVFHdxn2XE6cNPTSI
	d49VTKoRG16bjdlrgVXjtxSjiNgIo9Nwka9wwbgS0loVoF/EwAe8K1K+m00Amn7dAzhlYfEzTnLK0
	x4KYdt+vBV3uwrOwx4kxG/fvCjNXGWaCpGLNZkKVI3O03oVbVRGjA4gduuqLPiRCWfCAdUjR2gnTK
	wqiYv7aQ==;
Date: Sat, 4 Jan 2025 19:20:15 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, aaro.koskinen@iki.fi
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
Message-ID: <20250104192015.0a7a4f47@akair>
In-Reply-To: <3bde5a34-4bb8-42a3-ad5c-eeb495c6aa6d@kernel.org>
References: <20241230195556.112118-1-andreas@kemnade.info>
	<3bde5a34-4bb8-42a3-ad5c-eeb495c6aa6d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 4 Jan 2025 19:45:35 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> Hi Andreas,
> 
> On 30/12/2024 21:55, Andreas Kemnade wrote:
> > Usually interrupts are overwritten in the board file to specify a
> > mux-dependent dedicated wakeup irq, so there is interrupts and
> > interrupts-extended property which is not allowed. That has generated a
> > lot of noise during dts changes if just a phandle involved has randomly
> > changed.
> > 
> > Avoid that mess by specifying interrupts-extended in the dtsi file.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
> > Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/
> > ---
> >  arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> > index 3fcef3080eae..150dd84c9e0f 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> > @@ -1414,7 +1414,7 @@ SYSC_OMAP2_SOFTRESET |
> >  			uart3: serial@0 {
> >  				compatible = "ti,omap4-uart";
> >  				reg = <0x0 0x100>;
> > -				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;  
> 
> At this point interrupts-extended is not applicable.
> 
we have it this way also in omap3. I do not understand what is the
problem with it. Do you have a pointer where it is forbidden?
At least
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
says nothing againt using it in such cases.

> We could use
> 	/delete-property/ interrupts
> in the board files that needs multiple interrupt parents?
> 
What is the advantage of using that more complex solution? I would then
prefer to have the same with omap3 and omap4. If we do anything about
interrupts in board file here, they will have multiple parents.

Regards,
Andreas

