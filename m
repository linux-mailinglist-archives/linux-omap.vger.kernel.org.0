Return-Path: <linux-omap+bounces-2440-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F29A1EF4
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 11:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 084301F21E89
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 09:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843D71DB34B;
	Thu, 17 Oct 2024 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KqcUXZ7b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF71D9660;
	Thu, 17 Oct 2024 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158590; cv=none; b=W3q8kKxUbZ1sGVzSk3kPkDWZ4gyLqxJ1cYdkykhZfNWlLbFfDKcf2InR9gtJYifEG+P7pdt6/1w150M5q18v/k/Z6TB3jIO8Iwoi0vZSfA7fqLoZfimhW2S2eqliLexXgAk9c74Sjxcq2BxaWmkOUWQkVCbN8fNw5HKPkekEWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158590; c=relaxed/simple;
	bh=2wZg0oXgvbXJdjVnabs2hqotKgpbefNELHGNr8c2O9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8RU01iLdMzUwl03Oqw4Xqo58aYOISU4v4aCq3kiBnPlLEbFKJeWQYE6mL4g2o71UIKp3NzFRuTqXgJbdXsZ09oR+W5P+DoCXN5FUpf6Lda4keFjQLzgmxqETaMWEvAsCRISuvbApzspZtbgnNYxbRjFvuNDhcYiVF0J3Yn+xQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KqcUXZ7b; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PAmgwQ9HJVkLBL3nAuwtVWU4GsXSFcbwnusbC9mK3S0=; b=KqcUXZ7bvW99bnhv6i+JE/H7Z5
	niw3SJXX7OuDcYkt6McP1BULZZIyMTvoy4c8Xmv+1gsDh0HoJd/RMa4aamzsYFheREVXG5gnm85CC
	dGdByyXmdv+fUMdmGXNut7YYREjxLu5MMPShwwMJwU/b5VMHrVuUitShYRO4fHH39vrCzTxMmIEgn
	OB40/RhpAj86/QL1dADAdsF9nphGCnNyGKnf9yZUDss09qfH4TWxJUvcYjYz5xv9oSpnPeg2L7JY1
	yp2B6TZA0qiSyp00E33tNkOirwMQdFXtBWqkLDxaQxsR7IMDX40XRVV7qI//Yc+F1oV0Gqr20wR49
	90+tHBwQ==;
Date: Thu, 17 Oct 2024 11:49:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, tony@atomide.com
Subject: Re: [PATCH v2 0/4] ARM: dts: omap: omap4-epson-embt2ws: misc gpio
 definitions
Message-ID: <20241017114934.240d35b4@akair>
In-Reply-To: <172857036157.1533290.9663617637580743712.robh@kernel.org>
References: <20241010122957.85164-1-andreas@kemnade.info>
	<172857036157.1533290.9663617637580743712.robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 10 Oct 2024 09:30:09 -0500
schrieb "Rob Herring (Arm)" <robh@kernel.org>:

> On Thu, 10 Oct 2024 14:29:53 +0200, Andreas Kemnade wrote:
> > Bring the system into a more defined state and do not rely
> > on things being initialized by bootloader.
> > 
> > Changes in V2:
> > - better comment strange GPIOs
> > - proper names for regulator nodes
> > 
> > Andreas Kemnade (4):
> >   ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
> >   ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
> >   ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
> >   ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
> > 
> >  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 183
> > +++++++++++++++++- 1 file changed, 179 insertions(+), 4 deletions(-)
> > 
> > --
> > 2.39.5
> > 
> > 
> >   
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in
> this series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the
> warnings are fixed by another series. Ultimately, it is up to the
> platform maintainer whether these warnings are acceptable or not. No
> need to reply unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y
> ti/omap/omap4-epson-embt2ws.dtb' for
> 20241010122957.85164-1-andreas@kemnade.info:
> 
> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0:
> {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts':
> [[0, 74, 4]], 'clock-frequency': 48000000, 'pinctrl-names':
> ['default'], 'pinctrl-0': [[115]], 'interrupts-extended': [[1, 0, 74,
> 4], [116, 260]], '$nodename': ['serial@0']} is valid under each of
> {'required': ['interrupts-extended']}, {'required': ['interrupts']}
> from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0:
> {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts':
> [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names':
> ['default'], 'pinctrl-0': [[118, 119]], 'interrupts-extended': [[1,
> 0, 73, 4], [116, 220]], 'bluetooth-gnss': {'compatible':
> ['ti,wl1283-st'], 'enable-gpios': [[120, 25, 0]], 'clocks': [[121,
> 1]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is
> valid under each of {'required': ['interrupts-extended']},
> {'required': ['interrupts']} from schema $id:
> http://devicetree.org/schemas/serial/8250_omap.yaml#
>
To make sure I am getting this right: According to wdiff, the
difference is:

 'pinctrl-0': [-[[116, 117]],-] {+[[118, 119]],+}
'interrupts-extended': [[1, 0, 73, 4], [-[114,-] {+[116,+} 220]]

So my understanding is that phandle numbers are reordered and one
of the reordered numbers pops up in a warning message and cannot
easily be filtered away. Are there any tools or procedures in general to
filter out phandle reenumeration noise? Also when reordering things
expecting no functional change and diffing dtbs that would be helpful.

Regards,
Andreas


