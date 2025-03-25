Return-Path: <linux-omap+bounces-3490-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E6A70505
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 16:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE303BD52B
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 15:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882C925D1E6;
	Tue, 25 Mar 2025 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7ooKK2l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00325BAA9
	for <linux-omap@vger.kernel.org>; Tue, 25 Mar 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742916380; cv=none; b=cEc/9mfbanNxz0zpM7jzsx3JK7xXwJiAMhjfxcVBxJQ4bNjXk/0qGK5bi665775f07DApJSCf/Z2zPo8M1/xYJawm5arw2tNSqU2lPRfHpZJRm7Ib1ZLVa8jdaQXGdL3GPBfA039ZPIj7XIfQJonX4Y6S1Q31YoJ4SMmjxt1eoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742916380; c=relaxed/simple;
	bh=oHJ7NHn18ZTqdJ+1jGt86Ks+cgWeeqJVGph7y0lU6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPEQWBdW0llt14zdfQr8qZZyQS9aEOxLgP6uKFAaDX6h/o3g2L0f1pNRQUXkJ5wKH8VciezmBC2JaAJAI22D9NHxQNKC6hQTXvOYPYyylWkOuKwanUTH6Yap+fyOSSKhqojnJDJID8sQ1CSIADsqt11JVGnTIAoc5kwNJv8kujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7ooKK2l; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3014678689aso8317917a91.0
        for <linux-omap@vger.kernel.org>; Tue, 25 Mar 2025 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742916377; x=1743521177; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDnldeg6W/1rz40qXEdWC7PCXkPqXTii6QHNT2tQjqU=;
        b=U7ooKK2l6ErN6cF8m2Vo0Xg1sH1B0wNbF8+q8aFZ15kXJBiK50qjL5k3UOYCIK5UiP
         F7iI4osfl+RJn3Apl53nZfCTi27+HZNcJUcf0EkD2NV+/HXzv/XokgEYOVodp5xEfUPr
         T3cEo4D8aPW3NhqWzftLHwsjVOAWlfa8Hh8ZyNuComWnngUGbxs4M3bDi0NVTAlxorTA
         5VbPj6T1m4Tkz9fa2/khNESgXI9xqfnFXdKMKWAVV9rhs63PAm3p9dS7Qqo1w66N3v+n
         MxUBADG4YBaQKsYE3mBbtoPcYeLb8KWESl4oDo0uppWfKVUeTQvLo7vy+mxMXToEOHBE
         lP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742916377; x=1743521177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDnldeg6W/1rz40qXEdWC7PCXkPqXTii6QHNT2tQjqU=;
        b=C8OalaKiyoOoiDsrctkWGAqXip+JLeW+EeOXMcuztsyry1qnCMY4ERmp3du9gBta5s
         h0Cnztwi9rMO3qytMWYKxtzP2D9TVFz4AXqVqTifHahbCqDBvGancuauBAT1Xmo87gku
         ElmN8zMM8GgweGuAi7P0DK2PbbB1ts/tQz93yT/D3zG7mt/dkJPQ1F5E5mD0m3gHDhpM
         NG+p3+coLZ2o0HZOYI5cuvdvQuNyU44Mrhfkbuz8dkkv1/8Jm9jH7keIyaDlahaE3oXv
         j2fjvJrkYj2DizeIGny8VcgTPnvq8QwAVmNGYP/x4kqQS1n80p+kAceus5VRBD9i+19h
         OhWw==
X-Forwarded-Encrypted: i=1; AJvYcCXiFLljUNjRho76WuPa1CqkkzI6zBhqwnkW3GR7sRdXqVWog8lPa/QVjJXJ6ajFq+AxnaujGj9eyx4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuLSmpe2yGLyL7uon+ouPe633UadqKhtDKzX5Kk5QeGhU6ypK
	AiG/mzKTN2/sfkndh5hj48mpcieNwuf2PuyRCn8Tx+/O7PqMwNCt9c728f7t7w==
X-Gm-Gg: ASbGncuDESJGUtGOcxlm5QXCpt/tipdqh5E7Ysuvx6h37bOJvADvnilbNAVYJH8xjFe
	MGCvYxxdHalMzYG2+B7B6umh9nIBdYJxWIan7PtNY+8gv+dpTiUymadI+qvavGY17oAbg6HG24E
	V3IqBYF9XHfa3itOFZHiMGxAxMUJDmA+6b8KS30M1Kk1y20INHqaUnjUkGs7GCinm03NdePrvCN
	ZjMTJO7d1xHAlr/0t+T/+SmqtyGQ4iD13QOvHKqhb2F9YhLwGNbHAyf6PiTpcgBRQp6Po4JDqV7
	8YmmUI3qpYizvhz5MwvNKSOkXCFmYLoBEzSYy+MGexoh+1drhBRJ4SJA
X-Google-Smtp-Source: AGHT+IHAz5zKC5LGUzafh40DAQCiyiA7I/xihj4TsaCt+ShCCQfQH6xabJ6+324CVpB/iZmGqJ1C/g==
X-Received: by 2002:a17:90b:134c:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-3030fe96732mr32216302a91.17.1742916376502;
        Tue, 25 Mar 2025 08:26:16 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf636122sm14517600a91.45.2025.03.25.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:26:15 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:56:09 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: "hans.zhang" <hans.zhang@cixtech.com>
Cc: Peter Chen <peter.chen@cixtech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "vigneshr@ti.com" <vigneshr@ti.com>, 
	"kishon@kernel.org" <kishon@kernel.org>, "cassel@kernel.org" <cassel@kernel.org>, 
	"wojciech.jasko-EXT@continental-corporation.com" <wojciech.jasko-EXT@continental-corporation.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, 
	"bwawrzyn@cisco.com" <bwawrzyn@cisco.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <bkw4xm4jwe3iuf6sixxl4udosea3bhlwogfua66naf5echbyzv@dlwcbscedh6w>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
 <20250319062534.ollh3s5t7znf5zqs@uda0492258>
 <Z9qO1f5MgNcwO5A4@nchen-desktop>
 <20250319095511.hf3y2c6vbbnm3ien@thinkpad>
 <a8966792-fa0e-4e8e-aceb-427819ae4ef5@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8966792-fa0e-4e8e-aceb-427819ae4ef5@cixtech.com>

On Thu, Mar 20, 2025 at 10:14:02AM +0800, hans.zhang wrote:
> 
> 
> On 2025/3/19 17:55, manivannan.sadhasivam@linaro.org wrote:
> > EXTERNAL EMAIL
> > 
> > On Wed, Mar 19, 2025 at 05:31:01PM +0800, Peter Chen wrote:
> > > On 25-03-19 14:25:34, Siddharth Vadapalli wrote:
> > > > > > 
> > > > > > Hello,
> > > > > > 
> > > > > > This series enables support to build the PCIe Cadence Controller drivers
> > > > > > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > > > > > Modules. The motivation for this series is that PCIe is not a necessity
> > > > > > for booting the SoC, due to which it doesn't have to be a built-in
> > > > > > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > > > > > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > > > > > supported by default. Enabling the configs as of now (i.e. without this
> > > > > > series) will result in built-in drivers i.e. a bloated Linux Image for
> > > > > > everyone who doesn't have the PCIe Controller.
> > > > > 
> > > > > If the user doesn't enable PCIe controller device through DTS/ACPI,
> > > > > that's doesn't matter.
> > > > 
> > > > The Linux Image for arm64 systems built using:
> > > > arch/arm64/configs/defconfig
> > > > will not have support for the Cadence PCIe Controller and the PCIe J721e
> > > > driver, because these configs aren't enabled.
> > > > 
> > > > > 
> > > > > > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> > > > > >   CONFIG_NFC_NCI=m
> > > > > >   CONFIG_NFC_S3FWRN5_I2C=m
> > > > > >   CONFIG_PCI=y
> > > > > > +CONFIG_PCI_J721E=m
> > > > > > +CONFIG_PCI_J721E_HOST=m
> > > > > > +CONFIG_PCI_J721E_EP=m
> > > > > > +CONFIG_PCIE_CADENCE=m
> > > > > > +CONFIG_PCIE_CADENCE_HOST=m
> > > > > > +CONFIG_PCIE_CADENCE_EP=m
> > > > > 
> > > > > The common Cadence configuration will be select if the glue layer's
> > > > > configuration is select according to Kconfig.
> > > > > 
> > > > > Please do not set common configuration as module, some user may need
> > > > > it as build-in like dw's. Considering the situation, the rootfs is at
> > > > > NVMe.
> > > > 
> > > > The common configuration at the moment is "DISABLED" i.e. no support for
> > > > the Cadence Controller at all. Which "user" are you referring to? This
> > > > series was introduced since having the drivers built-in was pushed back at:
> > > 
> > > We are using Cadence controller, and prepare upstream radxa-o6 board
> > > whose rootfs is at PCIe NVMe.
> > > 
> > 
> > It doesn't matter. Only criteria AFAIK to build the driver as built-in in
> > defconfig is that it should be a depedency for console. For some time, storage
> > was also a dependency, but for sure PCIe is not.
> > 
> > Moreover, CONFIG_BLK_DEV_NVME is built as a module in ARM64 defconfig. So it
> > doesn't matter if you build PCIe controller driver as a built-in or not. You
> > need to load the NVMe driver somehow.
> > 
> > So please use initramfs.
> > 
> > > You could build driver as module for TI glue layer, but don't force
> > > other vendors using module as well, see dwc as an example please.
> > > 
> > 
> > DWC is a bad example here. Only reason the DWC drivers are not loadable is due
> > to the in-built MSI controller implementation as irqchip. People tend to build
> > the irqchip controllers as always built-in for some known issues. Even then some
> > driver developers prefer to built them as loadable module but suppress unbind to
> > avoid rmmoding the module.
> Hi Mani,
> 
> I think the MSI RTL module provided by Synopsys PCIe controller IP is not a
> standard operation. The reason for this MSI module is probably to be used by
> some cpus that do not have ITS(LPI interrupt) designed. Or RISC-V SOC, etc.
> MSI is defined as an MSI/MSIX interrupt that starts with a direct write
> memory access.
> 

Yeah, DWC MSI controller is not a great design. The older ones are even more
horrible (using SPI interrupts for reporting AERs etc...).

> There are also SOC vendors that do not use the built-in MSI RTL module.
> Instead, MSI/MSIX interrupts are transmitted directly to the GIC's ITS
> module via the GIC V3/V4 interface. For example, RK3588, they do not use the
> PCIe controller built-in MSI module. Some Qualcomm platforms also modify the
> PCIe controller's built-in MSI modules to connect each of them to 32 SPI
> interrupts to the GIC. I was under the impression that the SDM845 was
> designed that way. The only explanation is that SPI interrupts are faster
> than LPI interrupts without having to look up some tables.
> 

If ITS is available, platforms should make use of that. There is no way DWC MSI
is superior than ITS. We are slowly migrating the Qcom platforms to use ITS.

And btw, Qcom DWC MSI controller raise interrupts for AER/PME sent by the
downstream components. So enabling ITS is uncovering AER errors which were
already present :)

> So the dwc driver can also compile to ko?
> 

Only if the MSI support is made as a build time option and there is a guarantee
that the platform will never use it (which is difficult to do as the driver can
only detect it during the runtime based on devicetree).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

