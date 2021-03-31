Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A2F34F86D
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 08:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhCaF7u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 01:59:50 -0400
Received: from muru.com ([72.249.23.125]:49076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233690AbhCaF7k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 31 Mar 2021 01:59:40 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C98AB80C3;
        Wed, 31 Mar 2021 06:00:41 +0000 (UTC)
Date:   Wed, 31 Mar 2021 08:59:35 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Chen Lifu <chenlifu@huawei.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>, heying24@huawei.com,
        yuehaibing@huawei.com, weiyongjun1@huawei.com,
        johnny.chenyi@huawei.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ARM: OMAP: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <YGQPx5UMmHnFoJi+@atomide.com>
References: <20210327095227.105081-1-chenlifu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327095227.105081-1-chenlifu@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Chen Lifu <chenlifu@huawei.com> [210327 11:53]:
> From: Lifu Chen <chenlifu@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().

Thanks applying into omap-for-v5.13/soc.

Tony
