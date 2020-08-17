Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DBF246544
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 13:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgHQL0O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 07:26:14 -0400
Received: from muru.com ([72.249.23.125]:40522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgHQL0N (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 07:26:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2AA4580A3;
        Mon, 17 Aug 2020 11:26:12 +0000 (UTC)
Date:   Mon, 17 Aug 2020 14:26:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc:     linux@armlinux.org.uk, t-kristo@ti.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Fix an IS_ERR() vs NULL check in
 _get_pwrdm()
Message-ID: <20200817112640.GG2994@atomide.com>
References: <20200724035430.96287-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724035430.96287-1-jingxiangfeng@huawei.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jing Xiangfeng <jingxiangfeng@huawei.com> [200724 06:51]:
> The of_clk_get() function returns error pointers, it never returns NULL.

Thanks applying into fixes.

Tony
