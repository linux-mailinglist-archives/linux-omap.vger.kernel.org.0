Return-Path: <linux-omap+bounces-1985-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5995CB9B
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6F9AB210E6
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B2B18756E;
	Fri, 23 Aug 2024 11:42:43 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94E14C584;
	Fri, 23 Aug 2024 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413362; cv=none; b=G+6hx3FCThoY+Eq8fxGtfMmB8pdQdbPjtRDb18ldvwvtUoiPgtTgjq1M8TWbA1v2Zail1gxBSY48k03Iy4DXtIjKMBNmkbcaE/mv+M6907ydl0YRfUfQTIubIZ/tIqiXiBd/hrwZ2lThH08IF7M7rry3A4tZOwODeozfD+bJ9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413362; c=relaxed/simple;
	bh=XZ2OiPFk/tih8WmGLO17/CJZ9qurfogqbFXkNyEqhyg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4jFEQl2SLEKnvrT2N6/U41dw70J2PrUyAkHQEOcjv+8nsd8J8hjH2BZpSQmNCUGAzWHFnmeb0jCVTECbWIvQZum2WPvhECC0NZebHup3q1n1K0yu4ziMRBZSHngVuBcdsjaC2r9fb02jUpjtZza7u1jejr1Otsr7RbSLYbOSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqylj0dsVz6DB7g;
	Fri, 23 Aug 2024 19:39:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id DDE701400D4;
	Fri, 23 Aug 2024 19:42:37 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:42:37 +0100
Date: Fri, 23 Aug 2024 12:42:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/7] memory: omap-gpmc: simplify locking with guard()
Message-ID: <20240823124236.00003e5a@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-3-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-3-01668915bd55@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 23 Aug 2024 12:15:58 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Simplify error handling (less gotos) over locks with guard().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Simple one. LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


