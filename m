Return-Path: <linux-omap+bounces-2695-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8A9CDB6B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 10:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD1828238F
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 09:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2382D18DF89;
	Fri, 15 Nov 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVNKgkYd"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FE18785D;
	Fri, 15 Nov 2024 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662444; cv=none; b=vD+xcG+62ttHorgGzOzo9Qkq5VPTwKdY3zRdmBvOSVDN3ziC3+EUiv1tjEdQhGpUDCIFLPjIF8Qcw/BrR54kQH5GsFTqVngiI9+xmJSUF0KWDDCDyroCmccyAz9xFFXz/gdRAs3skJjH3tdQWwNPBev3xdrP/3SVpSCPTQL5Ul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662444; c=relaxed/simple;
	bh=IB0RG2WLffWzG23kPUVXGFSIfgQypIwTKY9WhcpAMdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGeNT4du0Lc1AClfxr8B0uRP80sghLz711v+caNM6qsExWnBk0164DVP2vbPkiqvhDXAoti4sHbgVXJJdywWzhHma6H2nQxUa/vEizeEhwOdeXJor4q8vV1cphHZLdTuk5qJ5Su8Jm/hD5eNka/6aZnIP2OKn+1wj3HMbOE8f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVNKgkYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FF4C4CECF;
	Fri, 15 Nov 2024 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731662444;
	bh=IB0RG2WLffWzG23kPUVXGFSIfgQypIwTKY9WhcpAMdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fVNKgkYd3irQbq5r0MZm7+PCwh+Q/Wl+2cFDo3OcyQq8FoksCOaMDmUT6OLnwBVF8
	 lKIy0aI0nggmosp1spTG0PvRgvG/7sUvPs5xFaEqxT/SVlISzXeVEiV+lVSNvN/lJ3
	 WBirdilHkVi8yqsP+t3z/KUU4aiBToBwmbFhAyMdMwCJEx/M4ueEvdtqc9LhvOaLpp
	 cN2j7zgUVAE1VtNN8sXFA26rgisP15uWoqDgM88vJbPDqxGWsyctbobCKnm8fd1PRx
	 snumFwiyZPsd8HOaN2LGWvXNOEkmlgB6GIbTdAWFNg5k7yk/fgmI4+Q1VkaOJu3Twj
	 3kzqeXZMaF6ew==
Message-ID: <e4c45744-3e5d-4ded-a33e-0d9097aebcaa@kernel.org>
Date: Fri, 15 Nov 2024 11:20:39 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus
To: Romain Naour <romain.naour@smile.fr>, tony@atomide.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 stable@kernel.org, Romain Naour <romain.naour@skf.com>
References: <20241114155759.1155567-1-romain.naour@smile.fr>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241114155759.1155567-1-romain.naour@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/11/2024 17:57, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> A bus_dma_limit was added for l3 bus by commit cfb5d65f2595
> ("ARM: dts: dra7: Add bus_dma_limit for L3 bus") to fix an issue
> observed only with SATA on DRA7-EVM with 4GB RAM and CONFIG_ARM_LPAE
> enabled.
> 
> Since kernel 5.13, the SATA issue can be reproduced again following
> the SATA node move from L3 bus to L4_cfg in commit 8af15365a368
> ("ARM: dts: Configure interconnect target module for dra7 sata").
> 
> Fix it by adding an empty dma-ranges property to l4_cfg and
> segment@100000 nodes (parent device tree node of SATA controller) to
> inherit the 2GB dma ranges limit from l3 bus node.
> 
> Note: A similar fix was applied for PCIe controller by commit
> 90d4d3f4ea45 ("ARM: dts: dra7: Fix bus_dma_limit for PCIe").
> 
> Fixes: 8af15365a368 ("ARM: dts: Configure interconnect target module for dra7 sata").
> Link: https://lore.kernel.org/linux-omap/c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr/

Please add the stable tag here

Cc: <stable@vger.kernel.org> # 5.13

> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---

-- 
cheers,
-roger


