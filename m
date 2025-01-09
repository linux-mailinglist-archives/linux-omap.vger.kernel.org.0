Return-Path: <linux-omap+bounces-3055-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6897A07B6B
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C89E161078
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 15:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553932248A4;
	Thu,  9 Jan 2025 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDRJbxSo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8522489B;
	Thu,  9 Jan 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435389; cv=none; b=Jp2PHb+RDICGlmPgp3WxAq4+CElBwCrYf82y1qKbH8jjJSDxuDXg2F3oIozISn5lbxRtrWnYS3HLOWs16fkOWEGXycdETT48ukT6W1hQh9fAunnMBv5MNi4pVXRQJ/oaZAqEJim/KcFTN8pSqUzQk3gmzMFVTb7UwDsczEA69Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435389; c=relaxed/simple;
	bh=dyVjxrvEDQQ08muhGpvtbe35aBVJ/h1rrRcp0echcvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzEMlnTpSUOVY0f+bLWva8WSc03zf5HLhagT1qClEwXJSP9l1O4QOf5IYQ9FlpQdREv9d/XluoYjB5ZYZJn9GnG5QCENZuoZT7fB0RSBExAc5LMXfS2DmxM81RYa/XYEIyKVC8faamE6wMWor/bt+R8Qnsq1IY3Bu3ERHF81aHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDRJbxSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551BDC4CED2;
	Thu,  9 Jan 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435388;
	bh=dyVjxrvEDQQ08muhGpvtbe35aBVJ/h1rrRcp0echcvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDRJbxSoJQ4JcsUh1faoteY/sVNy9vA5BM+h32TQzdaWwBHKCzgnOhzQnQl0CywTy
	 fgFviJ8CFOaokOqTkxNitiG8/Do2yJM3YsGksS9frMRzO9zFm/zIxFPUHZcdQJcmXO
	 JH7HHFLrRrPOR0/vOoCyF7eJyjHSEuEfoazgNm5JzdWj4jIAFpf2P79rR45iv7MLmK
	 DZCAPVtvPcQIVXFgIglKgEteMYCHbUvrLzJ2PxyObQju7MS5DXQwXsCEMjPSp6rKwF
	 Ep/WnycWgbQJkQDH3LMgr7nL0s8dDtFHLVpokH+5KSXhfCD8XRUS1aVbqxJosKvmsT
	 Sf5833YRySd/A==
Date: Thu, 9 Jan 2025 09:09:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, afd@ti.com,
	devicetree@vger.kernel.org, kristo@kernel.org,
	Romain Naour <romain.naour@skf.com>, vigneshr@ti.com,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <173643538692.3377192.11706052160856350643.robh@kernel.org>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-1-romain.naour@smile.fr>


On Thu, 09 Jan 2025 11:26:26 +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
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
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> v4: Add missing change in the second list (From Andrew Davis) [1]
>   Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
>   [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
>   [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> 
> v3: new commit
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


