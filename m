Return-Path: <linux-omap+bounces-4781-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29928C0BFB8
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 07:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DFBE4F0AD3
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 06:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CB82DC797;
	Mon, 27 Oct 2025 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqvMEY1U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427C2D5A14
	for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547338; cv=none; b=c2TSil5p5ERLIuOIHPqZ6uZE6RuHhqCPnlTrnCbMMT/7ZtPFCvwNiPXFohnnYX7wKUY4yRdK+8WISNIJ/kCsA/dPtfQSY0mAaZz1HQ7GLm8d52o4jIwL+KIKf4WAUIJWyoQVenqnswtsNbFgRht6z5JxM7hPnXZFHcV3EPxGguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547338; c=relaxed/simple;
	bh=oreL+ACETkIuRzK2D2r0xoY5Bjsmctzbdbz0anwCcIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWoJlyc9PYMFN6yL0NpAqCNajZpqUvn6iYutWR63dnI7wNG6L8SaDgI54EEa0k6YAQd/2wGdlGweFLAOFxITt9ev7ocZLkrU3r2Xdaux6Ma4FvAxaZD8rqIeW/P7cp/gtLFVxr7VLSqTdgpC9Lx5M+R16rxWtSRaKWXkLulj+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqvMEY1U; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63e0abe71a1so8452555a12.1
        for <linux-omap@vger.kernel.org>; Sun, 26 Oct 2025 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761547335; x=1762152135; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tID2O9rtuhA1HdKtwWUF8mN/hhDrcp/NLBhknx3DjcA=;
        b=cqvMEY1UN9AnTQnHTfUr1TJOPuYkbzDgTNCG8/jhuVLNh/NQD0UoJ5qrgQ8VLacRmf
         FEOitkfsT9yk0u1fF9Hzo6UtyoAiftygLxr/hyojgfFn1LTSxAYqkxy6FZfNteOYZzZm
         4BgsHt51yg7Ffl0f++m9FRdHVuLZRtXTwIJEx0J3BZvu1N0bG91eZJNAqbkzIttTriPr
         DmjtF4Ov2D0DKnzjRzalBmNuRVKOsWMguF7HNrYdDfw1GcAupXFQuUdUzCA9+Byrv9SU
         ekPHk022TkCjS3D0yuv0BzFVGHsz0Ld1G9TctW9IDdMASDr367Sic3Kbh+HcoolOiHbg
         QGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761547335; x=1762152135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tID2O9rtuhA1HdKtwWUF8mN/hhDrcp/NLBhknx3DjcA=;
        b=sO6rFp96L9AT8t6G8tLo7MmYeUMO/gI3CobSk3Ash9Q2b7YLToISHtE5FjEgZL8Mow
         4aFg9D9hSZ7sbrMfgf2uhZSMOAyEsl0ht9OiLpSjYoP6wzBb6B0ZqJslroN4Rq//fxB0
         u0XN4MAmI8o6e+BZsceO3heEJOuFzWjxDFNQV/A8Jx4KIeI1xzAYT6c/cdDMG4gvz+10
         ENvUKQd8VN38jOx5fNHxdOYhswE7zw/A6GsYPEP2Fm/mgSkhSqz+bqwCmM/zkzEWRhz9
         eJ2fs7GQnyrShbeVGXrJ1VpfIH3dShi1X3aOmE+cXnshixPXz6GC6kILMg4xmS+QOjmR
         wXBA==
X-Forwarded-Encrypted: i=1; AJvYcCW0lb11NZzvj21PVHBHWcPsWm9xGJUcnqzBiTtEkEijNnUvj5SDhqCcL5uDL8FvEdsvjZVeu2Q6p7YU@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKQekB+Hsn/PtIph+rjJkr9vXrdE2qP+y7tDZ8rPlAi3+MpY0
	skSwjIH/aFNWyeGx87aR/ir8w9HW3cHewJAd/1yzI/qCTNi4n/x9yUcpOXJ1nMwXgo1lVLLRWHp
	vRBcwNYytbPICPQ/f/qLkMu7bqlVDedY=
X-Gm-Gg: ASbGncv2CFUdJNAfmM5fy9+uHQE4fcon/NWqnvhG0ADDGbbbpqy6eFTCCIQ3/hK7Cqi
	CGleROFYsb1Vaizv+7mLqWxcnNHwe/T/w6uGMcbA/Tabc6R6Bh/m1Mw3sPN6UgCrYg//8ebX6IG
	1fYuYLfbStMHFWV4QJzcJMu/Ho00lXJifzU/dUZy+0FiBOyDqMnAcY5HDMBRkrrhlruM28/3bg1
	RHBjZD9+yQqWA+J4bcT4QmB2XjJ3QTfL8tsIrh9al5LrEUwpxRte5RF+zA=
X-Google-Smtp-Source: AGHT+IFYyZXaxe+78PDzeedHWs3RAFG6tJ/BOlzbjZKOPUVztXY1AhNbupmOsYKoQaqvdewKBvyACvqak2464exO6W0=
X-Received: by 2002:a05:6402:40c8:b0:63e:1354:d9ab with SMTP id
 4fb4d7f45d1cf-63e3dff6f32mr13460304a12.8.1761547334887; Sun, 26 Oct 2025
 23:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025074336.26743-1-linux.amoon@gmail.com> <20251025074336.26743-2-linux.amoon@gmail.com>
 <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com> <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
 <bef3d7015012c4004d21cd829892ca942496a6dd.camel@ti.com>
In-Reply-To: <bef3d7015012c4004d21cd829892ca942496a6dd.camel@ti.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 27 Oct 2025 12:11:57 +0530
X-Gm-Features: AWmQ_blmB6e4uKlIUktX-y8N5PH8rT71hGdHJ3kVMKE8HEWamdNJJ_ocuOBGSVs
Message-ID: <CANAwSgSTncwug+nUpm1pc2H8L0Abvumh8x09AW5p0nr8ufz-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to
 get the clock
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Siddharth,

On Mon, 27 Oct 2025 at 10:42, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>
> On Sat, 2025-10-25 at 14:07 +0530, Anand Moon wrote:
> > Hi Siddharth,
> >
> > Thanks for your review comments,
> >
> > On Sat, 25 Oct 2025 at 13:20, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> > >
> > > On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> > > > Use devm_clk_get_optional_enabled() helper instead of calling
> > > > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > > > the clk_prepare_enable() and clk_disable_unprepare() with proper error
> > > > handling and makes the code more compact.
> > > > The result of devm_clk_get_optional_enabled() is now assigned directly
> > > > to pcie->refclk. This removes a superfluous local clk variable,
> > > > improving code readability and compactness. The functionality
> > > > remains unchanged, but the code is now more streamlined.
> > > >
> > > > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v2: Rephase the commit message and use proper error pointer
> > > >     PTR_ERR(pcie->refclk) to return error.
> > > > v1: Drop explicit clk_disable_unprepare as it handled by
> > > >     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
> > > >     internally manages clk_prepare_enable and clk_disable_unprepare
> > > >     as part of its lifecycle, the explicit call to clk_disable_unprepare
> > > >     is redundant and can be safely removed.
> > > > ---
> > > >  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
> > > >  1 file changed, 5 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > > > index 5bc5ab20aa6d..b678f7d48206 100644
> > > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > >
> > > [TRIMMED]
> > >
> > > > @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
> > > >
> > > >       if (pcie->mode == PCI_MODE_RC) {
> > > >               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > > > -             clk_disable_unprepare(pcie->refclk);
> > >
> > > j721e_pcie_resume_noirq() contains clk_enable_prepare().
> > Ok I will drop the clk_prepare_enable and clk_disable_unprepare in
> > this function?
>
> The clock needs to be disabled on Suspend and enabled on Resume.
>
> The reasoning behind replacing:
> devm_clk_get_optional()  + clk_prepare_enable()
> with:
> devm_clk_get_optional_enabled()
> is clear to me, but the removal of the 'clk_disable_unprepare()' on the
> Suspend path isn't.
>
> Removing 'clk_disable_unprepare()' in the driver's remove path makes sense
> because the
> devm() API will automatically disable and unprepare the clock when the
> device is "unbound".
> However, to the best of my understanding, the device is not "unbound"
> during Suspend.
Thanks for clarifying my doubt. That part makes sense.
> Can you clarify why 'clk_disable_unprepare()' should be removed in
> j721e_pcie_suspend_noirq()?
It happened by mistake.
> Regards,
> Siddharth.
Thanks
-Anand

