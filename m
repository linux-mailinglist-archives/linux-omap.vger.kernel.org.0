Return-Path: <linux-omap+bounces-1984-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD59395CB92
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EE4CB254FD
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C53318756A;
	Fri, 23 Aug 2024 11:40:40 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88021D52D;
	Fri, 23 Aug 2024 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413239; cv=none; b=CTDcNxqfcW2ksGobjVcUr0Hxo/LUFEbaJRYsnTbPvZ9T5IwJl61kjDFRrl4cwXyhuL9uS621ki6kZM/mhprUpYNQwxkLxSgX75qqLiWQv3Tw6Z2ZIEEx5jXCBnZtLeXNqRcYEm8DoXbn4EtgVa8HP2CE2+DF9hjAzTUNj7+tfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413239; c=relaxed/simple;
	bh=kao6Pa3wdh+gbXPN3x0fWVZ9uW3JLbRwfjk1XlTuA00=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spO3kkRMgOEruV+jzTNKPFVPceEZg0wpNb04AhtU0qfguElIFdWsLzFuOw6j4gOJFPow/q5qCpxgUFRU4xemLLpggS6TXocISdq1gaDFEiIh4HbNOv8/GoDRj1wA3EQHQG5I1XHV5q9rYgg/w6Nz1fcDQT0IFCOPpD77cmXKb7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqyhd71Sxz6K6j6;
	Fri, 23 Aug 2024 19:36:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id E4E661400DB;
	Fri, 23 Aug 2024 19:40:34 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:40:34 +0100
Date: Fri, 23 Aug 2024 12:40:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/7] memory: emif: simplify locking with guard()
Message-ID: <20240823124033.00007f76@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-2-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-2-01668915bd55@linaro.org>
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

On Fri, 23 Aug 2024 12:15:57 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Simplify error handling (less gotos) over locks with guard().
> 
> The driver used file-scope variable 'irq_state' for storing IRQ state
> with spin_lock_irqsave, so move it into respective local scopes.  This
> should be equivalent, but more readable (less global variables).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
LGTM. File scoped irq_state is certainly unusual...

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huwei.com>

