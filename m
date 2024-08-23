Return-Path: <linux-omap+bounces-1988-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF695CBBA
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DB0D281DDE
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A244A1865E1;
	Fri, 23 Aug 2024 11:53:34 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555C57CBE;
	Fri, 23 Aug 2024 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414014; cv=none; b=SP2GVtkkBhxvYoWhSHuWpgcJyWswFVySwdBDbu6iL1PlLYOTvqdwhrZoIdWEwGoluh/RKtJ8rGyOxm7WvwcUjGpG80wnMnPUcKquwjdAjRxVBTZbt8r8mMgIvjGpc5gQInUyrIDvfx8V2D3ZCnBIWIAokZK79zJgIpB+IDHjnPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414014; c=relaxed/simple;
	bh=lok191rE5gIIbaM6CjAxRXxQZE5CfOdZgiZilTrfQXA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsNY50SARvUYdnGNvoeGWs0CeljMwOivNxkgcLZRo1T1YRemjBD0ySeZ7ujJJTdkkCN2IP8BDQiOsxeeG+LNp9S0hPT/BhbQ/Hy015Zimwl09b8OloHDykwRA+pkpv3kp9g2HmjZZ+Yz5ppLUTtD1bAMTae6LVWTPdVZYWjKIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqz0K2cT3z6K9QG;
	Fri, 23 Aug 2024 19:50:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id C567E140B3C;
	Fri, 23 Aug 2024 19:53:29 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:53:29 +0100
Date: Fri, 23 Aug 2024 12:53:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 6/7] memory: pl353-smc: simplify with dev_err_probe()
Message-ID: <20240823125328.000030e5@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-6-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-6-01668915bd55@linaro.org>
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

On Fri, 23 Aug 2024 12:16:01 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

