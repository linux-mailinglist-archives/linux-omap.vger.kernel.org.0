Return-Path: <linux-omap+bounces-2786-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B709E6116
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2024 00:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC1EF1653E4
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 23:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95781D47BB;
	Thu,  5 Dec 2024 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wu0M+LSE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC11D5144
	for <linux-omap@vger.kernel.org>; Thu,  5 Dec 2024 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440025; cv=none; b=KqWFZy+9w+lh3YMiR3lJ9dQHVUL1XUevSXQpzR4I1hLTJRBo8RIeRiIUt5pzT6LZ+WjbR6eh4Cf48i0d+rTdGuTbsxhrpx691IQCVneRbE336NqNd9QCwWCYXeAGS+ow2H6ABSxUyZCE7mCTe7Ik6xMCtbsvRBFvdnInE8be5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440025; c=relaxed/simple;
	bh=2HsTzA1w0YfwwqEx3xzfdl7kS22hPDUqbkpVscfFTV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X0YepvZYRGbkgRRXVu1wQK3mUyWBUv1R/abgL52oGVQmHYgHgRnNoLhjlPJdMOttpU6a68YsBbtDRl4Asjh3yhxdV3E1RkfEx6yOKaOyMQWu6TuE32wOo7qsOy+UHZ605onBKRNm8iJra3/m7GHPGvV3umuZYD0cw/XWXAetayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wu0M+LSE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215666ea06aso21570705ad.0
        for <linux-omap@vger.kernel.org>; Thu, 05 Dec 2024 15:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440023; x=1734044823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kle5zEPMtEhuui3Ww/DJjS4eRs1ij9eEcdmb0zWS6M=;
        b=wu0M+LSEgAHWfcfizfyp+h+JrNHpKUySIvkckofHOf5qBHdf7K424PK/EmEp2635xx
         3bupIqpWUjWl6bDf542o80orKpuO/IZsReYNJqXb+lGQd0sj+jYXpQexQJeoU08pVpRG
         pnmoxSK6FBGQ3BxggWvaZip/ldB5fKSb/098iuy0jfrjSHN1YX8RqLzx4fnVrgOiktfS
         NP1yOrCSD1K+zJwtSoptq/TEokGg9WphCPASlGGP6tZ/Quu2vYuNvnMAAAuApmquv9wm
         treHp93BWCRYBVdG/zvovqRG0susXXyvL83n+y252x/Pt088RUBXlMH0OYW+xkLMdQPg
         IAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440023; x=1734044823;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kle5zEPMtEhuui3Ww/DJjS4eRs1ij9eEcdmb0zWS6M=;
        b=Ployrr2+IOUX/WwfbzwYrGBiy8wlXXZ1jxTMxmajffUBI73fkipzvXjRJKJ2Q7g0Zp
         T2G2/7FTGfrR92e5pD2Nn9aHHixrVqCU0nXYzGZX1LMfMDR39Wgfp5Rq/8z8TQ3N83LK
         KIIUllK9qyv/5lIh1DxV7L0c42x1wAsMmttYpOXfhx/tf1EmaIqVNsUlmrYPQvFwIdC9
         VrUgvcRMgilZ5dNQnhf+Hvvb0DOOf0RE+awbk3DPQewhUqrC1DHsu8Y0CeL2NspWMiUU
         2gBe5g4GHmE/aKfHSepPh4Lc+HVDyww2ahKMgHt1KWMmW9ddIyBfOrTlkCxwSF/MKxJl
         JMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrnHei5cFgT/BFU6GiS0rsgppu5SP+2Omb07qmJaZksjDAVkOcshr75/z26uEEeOsIZ/mwzImRZe6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYv2vUokVgCYEYaBwpyLGOChzLqIniKKL2RdFFxSMe6WYX2IP
	diaaQFDc5ixzTDsb3gL5/h1HNDVjvu9C3gmGHggusisGtbAbkhliAFsdT09AcSk=
X-Gm-Gg: ASbGncsPMxz5/bXtsuaPX34cyTOG92oLGjFecHG6Q45jXIq7us0yUsmeDksTzV9SjCp
	Rietx8Muuv3pgItEPF2GlLqtTwkRKcKMLRTsRedQyZPL2rxGujI7EC8obMB6BbiSHSPufQVEvF9
	wjFIH2NG6dpofNiGlkPSi/g3DlLWdw5A1jjpOjk1GPv7wEWCxbtvwb3xBSBoJmf3DrpJhGPndKF
	KdM+MGSbH+Lw4Ik6qkQILkh6+SYsFJPybSX1UfR4plZLIAG
X-Google-Smtp-Source: AGHT+IHGIUGWc0kWhwreBCBvD1jXL3mC+VTLShhIdZHR+xTCtRjLfF4NDAE2iMiB0kRfqmx1ivCo5g==
X-Received: by 2002:a17:902:da8f:b0:215:8847:4377 with SMTP id d9443c01a7336-216112fb5e7mr15166295ad.15.1733440023266;
        Thu, 05 Dec 2024 15:07:03 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9f66sm17568485ad.115.2024.12.05.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, Romain Naour <romain.naour@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org, 
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>
References: <20241202143331.126800-1-romain.naour@smile.fr>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-Id: <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:02 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
      commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
[2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
      commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


