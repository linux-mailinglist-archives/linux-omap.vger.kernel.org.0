Return-Path: <linux-omap+bounces-4069-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA5AFAFD6
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 11:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B94517694A
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 09:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB3A28F94E;
	Mon,  7 Jul 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c3BDEB8s"
X-Original-To: linux-omap@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E04828A72A;
	Mon,  7 Jul 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880922; cv=none; b=f9aIaRR82qjkIPmnI5e9diCb/CmASmmvBLNfXZrKWx7AacSL/Mk2X9bmFGAa4PaDGByGC1Ad/Jy43kkcVfYpVWOC3vmwPPxPSO0Xbi5XfKSu9hgFQjJBS6qdp2OI22mBGmVGbcZZsJ3PUFq9dAZM1fTZURfE/PmAUUEFhLg8nhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880922; c=relaxed/simple;
	bh=3La3UPJ4ZAMHJ3BAEXORg3GiHQryGDV9WCTeMDTd35c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F90nm84tbTVLZAERv4/UGbjmkpb0DGCesDeLWZQUvo6KznU08r+qMTfkMWAYWgv3jxttAGkXmLW/ISQx6LKCu7LU3RbLR2s8AFKf2FB/MYnasV/40Or/jbZKBVhVkwEXKA7okwiWaOHTaPJ8E9yswyhDhYqG44TcGp/WrcXuZ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c3BDEB8s; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880918;
	bh=3La3UPJ4ZAMHJ3BAEXORg3GiHQryGDV9WCTeMDTd35c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c3BDEB8slb5r/poY7adzPw/Hl3p3xBCDxOvIY11eDdWzp/JxGpabSNqzSN11D0K0B
	 SZnx1m2y/a73e+9g1zZ4NK8uaqC2ToQyKbIO+UvckbyqaAT1szEFDwMXonBwRsbzbL
	 4LPkIToeE9Jp8dZDB6W1zfG2Sv5sZQevtVUedPBmdjrDv09z5u4yPUkHMilaNNBOah
	 VfY8oqhRF23SXg4IEaiyPXGdxorCHIs24QH5oV3ij1trlsT362waxDEhmX6LcVp/Zv
	 WkKs3SDrIO9k21cTOh2Y9pdzoYTZydLtH0Ur9YOgitTvJZpX7mQUuhr/8LBHsjaJK3
	 8DumFN0ZvMVvA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F46317E05F0;
	Mon,  7 Jul 2025 11:35:17 +0200 (CEST)
Message-ID: <d24bfc7f-c970-4082-83c3-896fb353b0ff@collabora.com>
Date: Mon, 7 Jul 2025 11:35:16 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bastien Nocera <hadess@hadess.net>,
 Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/07/25 09:54, Sakari Ailus ha scritto:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>


For MediaTek MTU3:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


