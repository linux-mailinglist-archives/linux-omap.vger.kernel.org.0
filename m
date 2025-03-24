Return-Path: <linux-omap+bounces-3480-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D255A6D50E
	for <lists+linux-omap@lfdr.de>; Mon, 24 Mar 2025 08:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881D0189215F
	for <lists+linux-omap@lfdr.de>; Mon, 24 Mar 2025 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A8D2505A5;
	Mon, 24 Mar 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIjUrsF5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13218D65E
	for <linux-omap@vger.kernel.org>; Mon, 24 Mar 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801120; cv=none; b=MA4uQqLkDT/YSLtt3QelWgEUhOSKjk5NgLx9YK9UgKpCb5+A//AJix0Pych9tlb7biLuBGyAMwaoOwceTiLw2yw65tNzWiTnlq8S3sFH0QuvnnYblBPHZNaCiGnyAgsfZy9E3he97mY/lslKC2HHVGgA3k7pYJ/8WY63SrR/bEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801120; c=relaxed/simple;
	bh=8MUuV6FO1ojBEDGqgDokijmkV6ruJlTuzs9K4PJfpJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4CDZ1f5YkSwjil8wWONcMc/2vph0mCVN1gPazH6b0vVkglgTTR9VzMOYN/eW3GeqUTrb4777pMX8SNnav19C/CcdlroEAQHFNRp3RVSB+dxswlkZumIi0EoY29P2L6K06mwP5qmx5pPd5Zc4+ZPi6hMyg8fiu0FoHUnlquSkeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIjUrsF5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227aaa82fafso17147075ad.2
        for <linux-omap@vger.kernel.org>; Mon, 24 Mar 2025 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801118; x=1743405918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vj0JbxrXAVA6oD7VcAtXgMKT4fAYOqVFgdHGQAEeEsQ=;
        b=qIjUrsF5/h4qhsTO/VIrQGTf6hYaNo+ItFq2CDKkBgwVPRgOUZ1ne7g7FHIDfsE4T+
         /9pMRMUM9qB5aBDipdNlw/2YBKoT++CHNEkDQI02sNxGUz+TtOkhGPmlyxC+nE6H9ywR
         Js3InfnEHx+7eMGYLIEwP83/D/+aj73GTyLQbU4WW4fKSY/vMhBye5PkwPMRMpqOwOs4
         RRlGr1PntMJmm9ClsnrnP71CDDXofhP0dTCG1tyRj1FLjTqeeJ4U0ghOkX0u7ul0h80y
         BA17pkaWIEoU/289Pt7465da9wkhhxvza4BU6N7ZP1Cs9QSMT7+iCEWMJF20EllQfubZ
         8Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801118; x=1743405918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj0JbxrXAVA6oD7VcAtXgMKT4fAYOqVFgdHGQAEeEsQ=;
        b=u0JNheJQTqUppgM+VgEwgTohexCEEWOjwd/llByWfPRawmnhHbGa7ixLPOoFqneYd7
         MIKkOga7IRT/fEkksk1Jvq1niACR4FlS4TdbYStwaANmnnT/AAGA1Cm6LJwVGbPLEmyX
         pcT9uywY0SJ9i/JaDengXit6XJbuE/Rh0OgGoIjCCfxaMA85iQYu55uvFURg61Ahgopq
         mt+QCIJacQGwEjqoe/u9dziTa+mvG/WaktFA2VCkWdCjwTf4yE7xHdi91m5Whlw3MHL5
         N/3etXdCsPCNckgihYwtAeSoJ2aFz1gMmEWafCUw8Ju1QY01NXn0VFg2bi7Si1RYd2C1
         Sz1g==
X-Forwarded-Encrypted: i=1; AJvYcCU+PxRTeNvKGS+ruFBSj3cdf9imW+0jVNSWQ+DeKaoLbFuHpAJBReHoJwdRk3+pWV77tB0d+Fbq/ZEV@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUuNQ4Z8NfYdRpzt/YOpD2hU1hxXNxYothRt0QAbNOIwmiFOa
	/AyNSGThKRhRamgWAd85LPfFq06gxxhBvj0YW2h6YL21HpAnUpPlLR+5gK2SYw==
X-Gm-Gg: ASbGncu8UUqpJ9CadVyUhMKakK465dGUJMuqfxL02t4sz4PIcHPEWviaP+h3F3xFUWz
	w44lnvgD7Jtl68sYQIYZjw4N5BE1Idh6itGilTD452fheIlgKrFFwIHy5lUcLalCs7RRwadFn54
	W/cIzvffvOQjryY2pfnO4ZfW5uvEu1gKNgvNrcE3VtXyVNFm0zG3ND0o6lMsgFbVaXW+vEo7Cnz
	n9eqCKe61X0ar+rEhFYcjdOW6TPENSrNoFIjE6eIzGcXAOuaADtdwWOyLe3yW8exxGKWyHYl95h
	CJAL16uUpp+muPCb+P4WwbslFwka0PwE59sugogXeSmk4qy27oRnFzkh
X-Google-Smtp-Source: AGHT+IFkcSPlya/dghCtIGB6baE4UY9siigdCJhCAQ1aprxfhPsqNa0EHD4upA3IZyCq4ENwSZDhpA==
X-Received: by 2002:a17:90b:4d05:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3030fe8d50amr13269772a91.4.1742801117734;
        Mon, 24 Mar 2025 00:25:17 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806fa3sm7307502a91.42.2025.03.24.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:25:17 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:55:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <5lyvmuk7o3nj6xaozyghxnhivwcmx2yisnbhwugklx5u5sutmz@26ta4e5en2mq>
References: <20250317184427.7wkcr7jwu53r5jog@thinkpad>
 <20250317194539.GA969005@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317194539.GA969005@bhelgaas>

On Mon, Mar 17, 2025 at 02:45:39PM -0500, Bjorn Helgaas wrote:
> On Tue, Mar 18, 2025 at 12:14:27AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 17, 2025 at 12:30:08PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Mar 13, 2025 at 11:35:21AM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> > > > > This patches basic on
> > > > > https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> > > > > 
> > > > > I have not hardware to test.
> > > > > 
> > > > > Look for driver owner, who help test this and start move
> > > > > forward to remove cpu_addr_fixup() work.
> > > > 
> > > > If you remove cpu_addr_fixup() callback, it will break backwards
> > > > compatibility with old DTs.
> > > 
> > > Do you have any pointers to DTs that will be broken?  Or to
> > > commits where they were fixed?
> > 
> > Any patch that fixes issues in DT and then makes the required
> > changes in the driver without accounting for the old DTs will break
> > backwards compatibility.
> 
> Right, I guess the rule is that if we have patches that fix DT issues,
> we should apply them as soon as possible.
> 

Right, and those patches should not break old DTs.

> And later if we ever have confidence that unfixed DTs no longer exist
> (or if we can identify and work around them in the kernel), we can
> remove the .cpu_addr_fixup().
> 

Yeah. Unfortunately, we do not have a fixed deadline or process. Just like
supporting the legacy broken hw, we have to keep supporting the old DTs for some
time and then get rid of them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

