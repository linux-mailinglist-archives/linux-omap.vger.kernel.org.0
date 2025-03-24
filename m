Return-Path: <linux-omap+bounces-3479-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC6A6D4FC
	for <lists+linux-omap@lfdr.de>; Mon, 24 Mar 2025 08:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8A3188D9E1
	for <lists+linux-omap@lfdr.de>; Mon, 24 Mar 2025 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143A124EF94;
	Mon, 24 Mar 2025 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcfwUvPn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42B153800
	for <linux-omap@vger.kernel.org>; Mon, 24 Mar 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800996; cv=none; b=u7wRZh1sSEOoclHgUeQq9v/XSsh45y57ynxxS16gEpN3kZbl1h5j2KkTAu5G8UtGCBlWBl1XmEbUko/hhMducdoRCv8Th+V9PzLCHy8jl8pBgSGuZMVdfqORtCVg4HBR7IVsQuRtgHMZeHKVxp8Ot1VcRomu65qYwNp1kZyiXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800996; c=relaxed/simple;
	bh=Rq5Qsj+vtD9TgfS3gUgFhd0FdKFXn64WXTOxKmO6hBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYNrq8NeHMrMy00oN9n49l/jwvJ7zaZ3jBMMx+wbBit6rxH3cmec13RIYt1pYqneIYTI04Jt4Sp+XOJZggSmqoA9wpYfFtYwTlv1pWBw6WEVwCsGSSPm9qesA4RB6AUE6NwppeSvEJWZDXXgjhJ/s/lQEwqsASjSBzPxYHGfCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcfwUvPn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2255003f4c6so73761125ad.0
        for <linux-omap@vger.kernel.org>; Mon, 24 Mar 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742800993; x=1743405793; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qe/MCCvdJLYJ3g+QnwJQUU6NC2SI4IaMPwysTrJxuV0=;
        b=AcfwUvPnzD8feBoFMYcGQDZr8gNGhElE2P9+5TlfXfzozRkql5+6bPoYp6tG7dBJH/
         tARAKzEXxuxrn49DEGkksvFJtgk0cXjWq4O9/ZIOKEoHlENv1NzM6+PL2eWATFdh6x+i
         NpwqxgWRndt5AITQs6ml/xpxPGQYpLnBGdgnUaNOs5MJmqoA2+QJn0C+PyyoqBRsw/FY
         yH5PqmuT5QIsaDh7kjEvsNlBrhUIyN/sBzk0X6b/B8M/mhL00QIkxQzZ3UZRWTw+NblC
         Rmo2+2cu9/VOOSVVjCqjAStp81GNNP9fYEE8NmZQ9FJ/fId/YYj5kNJGBBi9tlH280h7
         qvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800993; x=1743405793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qe/MCCvdJLYJ3g+QnwJQUU6NC2SI4IaMPwysTrJxuV0=;
        b=TV90uK0Y0qFKinOd9K0zS3kBZB9Nk1w5pCIY4pNxHl9DBXLkm3qXcKxzswOKngkBe8
         EiUQLw2rkyWtOH0iXGgHI5+7SXj4jHCC1UaXnGTieChaeksy7hSlbavbb4WP6UGS0MIX
         sKuiE3whKTLHnnlNlXxAE+Tknup6JjDaS3NFhjV9zwi+nk8DyqU67c3rD7HGavDV3b8K
         WtsSEmpb9gdm7GNlP1qZDwvpa41BBb+Mpvldh2yERC8sWyKfxkcmWycKCFWJQM0w0iW3
         11/6XUSnl07yTU1Yc8Tuo2vMpQDHX4kG2xpwEfCSwJTWdLShHvlq7cVrtIuof3U2Fk8T
         fZcA==
X-Forwarded-Encrypted: i=1; AJvYcCV4b8/z+6gjRGUtX5dxzuyOzXP52UpNBjLNXzQzfay/LWbeksqa3Tv1xsV8NWp8I2h0k0QHu8MzFwZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjj0uftvqwDrWxBr9ZxyfjPkLC5gNrwYvuEDuL9i6EPD7Keg0T
	g0mfkI7V/yuCnAB8X8Mc1HNDS/4dXEQtoOm4IVdjo21rPfNvvt20ASP+xRDnVA==
X-Gm-Gg: ASbGnct6aRuguH3rfhiQtJgl1scKgorAHwHwR8nYavOj5HDMUFUitCr/heoYh0NVWfY
	7UNtt8UnFuDwAaXgkRr6au9q6tJj5o4Ex84Roi1THUpm5MC8zwUSmmyZxmZiOvF5Zhw6yAGn1rk
	5Z50+gTGh8VcrMbYi3aQ3BetuSFxZQhpg4f0WkyKvaygyI+2h9+eiCMF6KGMMDHpB4lg83Nqtjc
	HmY+Aqc0k2216xZ7WUsHxz99tQ14QshPn48HrIHwB4KDVzyunvYLip4F1xgh6CtX095mXuRjjEV
	kxwU7yDKb1cyMNMuvOYFISeVPrc6shbBw16/VJtZxrdwMLKF9AiC4EYFGbX/Elu+Tkc=
X-Google-Smtp-Source: AGHT+IEVDoBTCHOODzvBGMAnc/Iok1j6AhaExydrGDQgnCUirKAYBNkCKwG2t70sQoq1tMM3o02m1Q==
X-Received: by 2002:a17:903:230d:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22780e46648mr200826765ad.53.1742800992590;
        Mon, 24 Mar 2025 00:23:12 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22781208966sm63304325ad.254.2025.03.24.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:23:12 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:53:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH PATCH RFC NOT TESTED 1/2] ARM: dts: ti: dra7: Correct
 ranges for PCIe and parent bus nodes
Message-ID: <hhvst2uvlymcyir5sb5vwd4ezko7yawwp5cnosluaz2hkabcna@ywr4thtjpdps>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
 <20250305-dra-v1-1-8dc6d9a0e1c0@nxp.com>
 <20250313165311.2fj7aus3pcsg4m2c@thinkpad>
 <20250314064642.fyf3jqylmc6meft7@uda0492258>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314064642.fyf3jqylmc6meft7@uda0492258>

On Fri, Mar 14, 2025 at 12:16:42PM +0530, Siddharth Vadapalli wrote:
> On Thu, Mar 13, 2025 at 10:23:11PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Wed, Mar 05, 2025 at 11:20:22AM -0500, Frank Li wrote:
> > 
> > If you want a specific patch to be tested, you can add [PATCH RFT] tag.C
> > 
> > > According to code in drivers/pci/controller/dwc/pci-dra7xx.c
> > > 
> > > dra7xx_pcie_cpu_addr_fixup()
> > > {
> > > 	return cpu_addr & DRA7XX_CPU_TO_BUS_ADDR;  //0x0FFFFFFF
> > > }
> > > 
> > > PCI parent bus trim high 4 bits address to 0. Correct ranges in
> > > target-module@51000000 to algin hardware behavior, which translate PCIe
> > > outbound address 0..0x0fff_ffff to 0x2000_0000..0x2fff_ffff.
> > > 
> > > Set 'config' and 'addr_space' reg values to 0.
> > > Change parent bus address of downstream I/O and non-prefetchable memory to
> > > 0.
> > > 
> > > Ensure no functional impact on the final address translation result.
> > > 
> > > Prepare for the removal of the driver’s cpu_addr_fixup().
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm/boot/dts/ti/omap/dra7.dtsi | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > index b709703f6c0d4..9213fdd25330b 100644
> > > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > @@ -196,7 +196,7 @@ axi0: target-module@51000000 {
> > >  			#size-cells = <1>;
> > >  			#address-cells = <1>;
> > >  			ranges = <0x51000000 0x51000000 0x3000>,
> > > -				 <0x20000000 0x20000000 0x10000000>;
> > > +				 <0x00000000 0x20000000 0x10000000>;
> > 
> > I'm not able to interpret this properly. So this essentially means that the
> > parent address 0x20000000 is mapped to child address 0x00000000. And the child
> > address is same for other controller as well.
> > 
> > Also, the cpu_addr_fixup() is doing the same by masking out the upper 4 bits. I
> > tried looking into the DRA7 TRM, but it says (ECAM_Param_Base_Addr +
> > 0x20000000) where ECAM_Param_Base_Addr = 0x0000_0000 to 0x0FFF_F000.
> > 
> > I couldn't relate TRM with the cpu_addr_fixup() callback. Can someone from TI
> > shed light on this?
> 
> A "git blame" on the line being modified in dra7.dtsi gives the
> following commit:
> https://github.com/torvalds/linux/commit/c761028ef5e2
> prior to which the ranges is exactly the same as the one being added by
> this patch.
> 
> The cpu_addr_fixup() function was introduced by the following commit:
> https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> with the reason described in
> Section 24.9.4.3.2 PCIe Controller Slave Port
> of the T.R.M. at:
> https://www.ti.com/lit/ug/spruic2d/spruic2d.pdf
> ---------------------------------------------------------------------------
> NOTE:
> The PCIe controller remains fully functional, and able to send transactions
> to, for example, anywhere within the 64-bit PCIe memory space, with the
> appropriate remapping of the 28-bit address by the outbound address
> translation unit (iATU). The limitation is that the total size of addressed
> PCIe regions (in config, memory, IO spaces) must be less than 2^28 bytes.
> ---------------------------------------------------------------------------
> 
> The entire sequence is:
> 0) dra7.dtsi had ranges which match the ranges in the current patch.
> 1) cpu_addr_fixup() was added by
> https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> 2) ranges was updated to <0x20000000 0x20000000 0x10000000> by:
> https://github.com/torvalds/linux/commit/c761028ef5e2
> 3) ranges is being changed back to its original state of "0)" above.
> 

Thanks a lot for the reference.

> cpu_addr_fixup() was introduced to remove the following:
> 	pp->io_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->mem_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->cfg0_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->cfg1_base &= DRA7XX_CPU_TO_BUS_ADDR;
> in dra7xx_pcie_host_init(). The reason for the above is mentioned in the
> "NOTE" as:
> ---------------------------------------------------------------------------
> The limitation is that the total size of addressed PCIe regions
> (in config, memory, IO spaces) must be less than 2^28 bytes.
> ---------------------------------------------------------------------------
> 

I don't think so. This note is for the *size* of the addressed regions. The
fixup corresponds to the sentence in your above note from TRM:

"able to send transactions to, for example, anywhere within the 64-bit PCIe
memory space, with the appropriate remapping of the 28-bit address by the
outbound address translation unit (iATU)"

I think the limitation is due to the 29-bit address bus width of the PCIe
controller slave port as mentionend in section, 24.9.4.3.2. And that correlates
to the truncation of the upper 4 bits of the IO/CFG/MEM addresses. So even if
the CPU passes address range relative to offset 0, PCIe controller converts it
to 0x20000000/0x30000000 based on the instance.

If my understanding is correct, then commit, c761028ef5e2 should be reverted and
this patch can be applied.

> I am not sure if Frank is accounting for all of this in the current patch
> as well as the dependent patch series associated with removing
> cpu_addr_fixup().
> 
> Regarding testing the series, I unfortunately don't have the hardware so
> I cannot test it.
> 

That's a pity. If TI employee doesn't have access to an upstream supported
platform, then I'm not sure whom we should ask for testing.

Could you please ask around and see if you can get access to one? I'm sure that
the hardware will be available somewhere :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

