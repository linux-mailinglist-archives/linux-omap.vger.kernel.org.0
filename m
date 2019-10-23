Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C164EE213C
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 18:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfJWQ7i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 12:59:38 -0400
Received: from muru.com ([72.249.23.125]:39430 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbfJWQ7i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 12:59:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 33CBF80CF;
        Wed, 23 Oct 2019 17:00:12 +0000 (UTC)
Date:   Wed, 23 Oct 2019 09:59:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ARM: OMAP2+: Remove duplicated include from
 pmic-cpcap.c
Message-ID: <20191023165934.GN5610@atomide.com>
References: <20191023062900.43576-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023062900.43576-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* YueHaibing <yuehaibing@huawei.com> [191022 23:29]:
> Remove duplicated include.

Thanks applying into omap-for-v5.5/pm.

Tony
