Return-Path: <linux-omap+bounces-3449-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17AA688ED
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 10:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75B58169E56
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 09:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6E3213230;
	Wed, 19 Mar 2025 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErJXr9Px"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730131C5D65
	for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378122; cv=none; b=qNKdNzBPCUw5xDTCHZqEIkrQbizEiZ+L2AqoBE4CeJNWGK5C0PwRiNTlZhOCl46TR/QVzz/fUkuGmuok/BvKT9T0p7ZTAI9icG4AYp1gltiqQvp7Bl6YkWKYifw3VutMXxgS0I3ZZGwX/RAU/HeR1oaOeiiIZX42Gn9uFxlxBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378122; c=relaxed/simple;
	bh=hBOe4eClj0gkWkRr8z2a+nIUH8GY5enRwn+OsacCLh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBtNoRYjL9b/ZrpT7xcENgsHszGQaNQAPsucQd99/4fK6c444U0FEUFLsN39eUBAqbVx3cyeKmtwW05e1a6KO4wCP+myi3pJo8FMEnsIf74D3QaO7dvgPXuChXGzKlm9BTns2i/3eg1jvAtAZL6twwijyrTmBvTV7U2JFVtwmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErJXr9Px; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224191d92e4so127871735ad.3
        for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742378120; x=1742982920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnVvGzQPAnyj4mnUyy5QvfWa2P714m+BjFv+31OFFM4=;
        b=ErJXr9Px3IqX5NAhegRhH0YTyzIiSSt18QCZSc7CbbWB0wWVj60R4jSC/BQoWDDvsW
         Az95PgUrJN/BQKQFlid8MV4mKxENbxdaPRDyWHMz9Z69Lr3os6saXGy7XSGq9AOEOyq2
         jPprev0z9MCzhl7WHjMEeXsHgx6bUZ/H3m2SoMmjyUZfq9ypJ5ELD1wqM8cqWt/4w53/
         BxYxdb8xLujafjHw92djc5uP1OeLdyVSdxS6UGBbfZ+72WY28EtL2kzsQRX9JjKB2k/4
         Tt1OJxXZEmZocVNzfyOfAfWXn1Zx05zj44LEkAvgfvd3n8mcWcJCrbSqh1t+CKCh6rfq
         tEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378120; x=1742982920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnVvGzQPAnyj4mnUyy5QvfWa2P714m+BjFv+31OFFM4=;
        b=AuUGnwbnWcWIRVEAtiDO1/qgIk7AlGc56b+H9+x0t9DT+8qSLv8ZGjkkjl+sm0VjOi
         pDBxKP8D4SbISN2abrdW5QwBR6Gs+C9OXyu/XJYkFO/FWZNriu2phICNXuouhu6S7AHS
         pAzytzBSTI/auLcgi1TgHrLeXjSsP8oZ+3nnRFK9CI0x1ditmPCSlqjYq6xzM1lQ2bEz
         tTPTSELsrWGxILpkO4JBYrBO+INzQFcsaC9sA3oIJ8xZa+jndAFa8TBxzfbyjaBXwtGI
         R0GnSeuQrnfxVOeJHIiUtPDeF2Ce1tfQKU4scQRXWAzpD2/WXdvnrd/h1OEFl6pqFaBU
         CANw==
X-Forwarded-Encrypted: i=1; AJvYcCXxaVNUb36EpZDBWHlwdGs1Tx3q51gjDvEbR6Jv4E45MNXYeS7jtBk6oLgSG9O6DW5CIWjDd9HSKrE7@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVFAS6Le5XE4iB94XiYyCZiyX1V7K96dx2mlFnDJsRX3GjVru
	6bABL3grtXH9MhAV+gkVmJ77i/V91z+gYf62iBnZJNGpWlU0ZDJ5haefE3azcA==
X-Gm-Gg: ASbGncsSk7bmez24FPUtfcdX/6tqs1m7L+wMt+OX0Z6JwyvT9WH44HFO7BAj8S9pdp7
	fM9ksIulLtHRQ3433YkHj7EB8rUTGaK0qwPetkK7fVnAFKNPaN/euqFYJEdID3kYyzE/xcm6CpA
	EGXpw1aS4XWRar9JOC56VMKU/Z2KvUQ6xJZyY514s0wdnAfKVls+Pej19csU0pJRHsrmSabq8yq
	4dsIiNB1jIYLSdP0axoPwFCp6qw2tVnYYoPNsmgoiRIRRKyeFPT4pQLAVbiQgWU4cxjWfDYaj+x
	Pa3bYOhaVw8Lt8IsCHhHS7RHiCvXDKPMFol7hOmwvRXwuu5Vgbr/Cds=
X-Google-Smtp-Source: AGHT+IGY1KwFvtNIJJm5MS9eiMIfZ3YUeAX6DKMaBqQ27dy8OhBjwCrp+JyiEaWtexFKt71h73MydQ==
X-Received: by 2002:a05:6a00:9a4:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-7376d645bcemr3514839b3a.14.1742378119616;
        Wed, 19 Mar 2025 02:55:19 -0700 (PDT)
Received: from thinkpad ([120.60.70.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0511bsm10473365a12.45.2025.03.19.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:55:19 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:25:11 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"cassel@kernel.org" <cassel@kernel.org>,
	"wojciech.jasko-EXT@continental-corporation.com" <wojciech.jasko-EXT@continental-corporation.com>,
	"thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
	"bwawrzyn@cisco.com" <bwawrzyn@cisco.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <20250319095511.hf3y2c6vbbnm3ien@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
 <20250319062534.ollh3s5t7znf5zqs@uda0492258>
 <Z9qO1f5MgNcwO5A4@nchen-desktop>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9qO1f5MgNcwO5A4@nchen-desktop>

On Wed, Mar 19, 2025 at 05:31:01PM +0800, Peter Chen wrote:
> On 25-03-19 14:25:34, Siddharth Vadapalli wrote:
> > > >
> > > > Hello,
> > > >
> > > > This series enables support to build the PCIe Cadence Controller drivers
> > > > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > > > Modules. The motivation for this series is that PCIe is not a necessity
> > > > for booting the SoC, due to which it doesn't have to be a built-in
> > > > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > > > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > > > supported by default. Enabling the configs as of now (i.e. without this
> > > > series) will result in built-in drivers i.e. a bloated Linux Image for
> > > > everyone who doesn't have the PCIe Controller.
> > >
> > > If the user doesn't enable PCIe controller device through DTS/ACPI,
> > > that's doesn't matter.
> > 
> > The Linux Image for arm64 systems built using:
> > arch/arm64/configs/defconfig
> > will not have support for the Cadence PCIe Controller and the PCIe J721e
> > driver, because these configs aren't enabled.
> > 
> > >
> > > > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> > > >  CONFIG_NFC_NCI=m
> > > >  CONFIG_NFC_S3FWRN5_I2C=m
> > > >  CONFIG_PCI=y
> > > > +CONFIG_PCI_J721E=m
> > > > +CONFIG_PCI_J721E_HOST=m
> > > > +CONFIG_PCI_J721E_EP=m
> > > > +CONFIG_PCIE_CADENCE=m
> > > > +CONFIG_PCIE_CADENCE_HOST=m
> > > > +CONFIG_PCIE_CADENCE_EP=m
> > >
> > > The common Cadence configuration will be select if the glue layer's
> > > configuration is select according to Kconfig.
> > >
> > > Please do not set common configuration as module, some user may need
> > > it as build-in like dw's. Considering the situation, the rootfs is at
> > > NVMe.
> > 
> > The common configuration at the moment is "DISABLED" i.e. no support for
> > the Cadence Controller at all. Which "user" are you referring to? This
> > series was introduced since having the drivers built-in was pushed back at:
> 
> We are using Cadence controller, and prepare upstream radxa-o6 board
> whose rootfs is at PCIe NVMe.
> 

It doesn't matter. Only criteria AFAIK to build the driver as built-in in
defconfig is that it should be a depedency for console. For some time, storage
was also a dependency, but for sure PCIe is not.

Moreover, CONFIG_BLK_DEV_NVME is built as a module in ARM64 defconfig. So it
doesn't matter if you build PCIe controller driver as a built-in or not. You
need to load the NVMe driver somehow.

So please use initramfs.

> You could build driver as module for TI glue layer, but don't force
> other vendors using module as well, see dwc as an example please.
> 

DWC is a bad example here. Only reason the DWC drivers are not loadable is due
to the in-built MSI controller implementation as irqchip. People tend to build
the irqchip controllers as always built-in for some known issues. Even then some
driver developers prefer to built them as loadable module but suppress unbind to
avoid rmmoding the module.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

