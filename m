Return-Path: <linux-omap+bounces-4769-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B628C08DE9
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 10:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409621C80541
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62983272E45;
	Sat, 25 Oct 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpChKIl3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56621169AE6
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761381482; cv=none; b=tEbpuYBx/pKFVxl153MUoPgzKUJVCKbr3+1IfvQ7uPQq2RNrkJpM46N4GKvG0SRpIRnMKUN7G7Uq4cp3DVFZpyLJpOC4qiSUPwsZnem9ohrPOxWgsmrXQRtpai7qieGvh8W3PETNHcNQQ0gw1WMP8lr/+rSIZKaJMq8n9fxrX6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761381482; c=relaxed/simple;
	bh=811uHJZ37wZfACPU1YGuEeWKbSyaapCx8BFKBu79UWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVWatVxkreXhJctgUc2wGgdkPD2oA+xNeG/90a0P5pjmI2tTYRSKpuS2FaR7m/v07c5LHfdhKogKV8bZReMqWs8xWpw2R1lbqcGGHHLR7TRzkRx3eTkeh8TYQ7CCijbQggKwcvcN3xETeRRckVCDoeawcOe9lRq1mX0QWC0VUPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpChKIl3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso618913866b.0
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761381479; x=1761986279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rt1zvt28at9xm8W3hs03xIo0raGpVE0ymzecLcbUr+c=;
        b=fpChKIl32RIl6MSzup/XREwSeOThdjqxXmB3RkXUywMmLUK62PsiwOtivjYW+WsgYD
         sSjRHrPRhPyabrJaEnPx81NaSTEzXFlie4QjoOadn+BMY0kyb4qYXw/Hn8sa7ctLmWxa
         X64MUREv15cikIdMGo9QAoatwKllxvIARzI0IbnEyeaPxihTbcDzZVQXSs1ZCgUkyve8
         cqwGOK8FsutPJqWpCNeM/mHd9nKTM/4oA60yKA0b0OXOv7HWdwf6YVqHze0FFjeQjQdt
         kQ466yaP1NgbBrE3e7tlr/UnC6wJWH/lh6eRXyHtYIMNRJfLQK1oqcTzSjpR8M6T25GS
         cq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761381479; x=1761986279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt1zvt28at9xm8W3hs03xIo0raGpVE0ymzecLcbUr+c=;
        b=MhVJTjhGJAmCJrbBK69cNnaWHbXN7bmC8SINh927F2uJuhMaa1xzshkdoyghxF5Tf+
         4ndsRiRSMVl3/D1OIWAyu8D1K8j6g+YYb2gHJPS4HFY3fIr0dGEvlzSlBwLQ2yzJfUwQ
         AN7MaA0OyROlPN1fwAjNOwj/yLd9Aw58jkr55XwUpmJFO0y/jgzzp45xhjC6b09mZc2G
         mNbhWh36S7uB3lEWYbNEUFes/v6PhfHX9AvjDIcwMbGssFk18NocQ5OAOJpyMX+KEBDA
         Oi9blXc7OGWAvX3myZz5goUTBJ58ocnTuZTt1J6TQ+EwKkgfi5nnHk9X2bg1KaslpUMT
         1ePw==
X-Forwarded-Encrypted: i=1; AJvYcCUmR4s0a/FPsPHK/Rohe8+CnikDtxKHCcK1VlKCQihLnNpnYTkUMIwzHmhmE317fqRFouXL/FnM7IUL@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSFS+N9XH0IK4ZSYV6ebdDXHvFa7IjlSavIjuDJxGsZBhHUKr
	djQ1SA0wLRRUgwp3HFeOmZGE20p0I4Feo0Wwv8KYmDHPy7aG134wZuMcQ6SwBWzDK2CV2xB1HJ9
	aSs/OdZJ8zq3iMigRvq3kkkVDHxtgU5o=
X-Gm-Gg: ASbGncsqr2xvaDkXi+LKo9i9Zx+KBtV7YaVYDPF18lnBuF47zuM5KmGrakHhgaQ0rgx
	2gMewUY57xVoR/5R9bAeIpOSdhn7kKzt/zhXVMEDcBh862k1CAqyrUbsvXS3JBhmpHeeIgqSvZR
	R44HBXxJZcZK67uvp8UJCRjwtfC1CAl8eykQHCjIrv6uRHl74r+/fPtJ9kqKhhgXNj1Rluq5oCa
	6K5aXo8+S2hYMVYa1sGVOfVge/Kt/7MkgawRhCWBSkD1nA4dyxu8XM3Fhbt+fuykmZF3w==
X-Google-Smtp-Source: AGHT+IFuGX6oiN+VZCvXlLc+k6tnFhyAvGLZQt/w/4MWDH5uLaa7YRkpj3wZ7I30zF9rslJZeftdwUUg96dShS04FjM=
X-Received: by 2002:a17:906:c10a:b0:b57:2c75:cc8d with SMTP id
 a640c23a62f3a-b6d6bb109d8mr624666366b.14.1761381478518; Sat, 25 Oct 2025
 01:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025074336.26743-1-linux.amoon@gmail.com> <20251025074336.26743-2-linux.amoon@gmail.com>
 <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
In-Reply-To: <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 25 Oct 2025 14:07:42 +0530
X-Gm-Features: AWmQ_bmQGviTXIcOd0mClyWfGzAI1T_FFNMyLfzBY5L8A_7DMNQFG7wRa3DtwXw
Message-ID: <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
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

Thanks for your review comments,

On Sat, 25 Oct 2025 at 13:20, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>
> On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> > Use devm_clk_get_optional_enabled() helper instead of calling
> > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > the clk_prepare_enable() and clk_disable_unprepare() with proper error
> > handling and makes the code more compact.
> > The result of devm_clk_get_optional_enabled() is now assigned directly
> > to pcie->refclk. This removes a superfluous local clk variable,
> > improving code readability and compactness. The functionality
> > remains unchanged, but the code is now more streamlined.
> >
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2: Rephase the commit message and use proper error pointer
> >     PTR_ERR(pcie->refclk) to return error.
> > v1: Drop explicit clk_disable_unprepare as it handled by
> >     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
> >     internally manages clk_prepare_enable and clk_disable_unprepare
> >     as part of its lifecycle, the explicit call to clk_disable_unprepare
> >     is redundant and can be safely removed.
> > ---
> >  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
> >  1 file changed, 5 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..b678f7d48206 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
>
> [TRIMMED]
>
> > @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
> >
> >       if (pcie->mode == PCI_MODE_RC) {
> >               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > -             clk_disable_unprepare(pcie->refclk);
>
> j721e_pcie_resume_noirq() contains clk_enable_prepare().
Ok I will drop the clk_prepare_enable and clk_disable_unprepare in
this function?
>
> >       }
> >
> >       cdns_pcie_disable_phy(pcie->cdns_pcie);
>
> Regards,
> Siddharth.

Thanks
-Anand

