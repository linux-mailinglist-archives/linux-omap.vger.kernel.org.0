Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F49F42375D
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhJFFJE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:09:04 -0400
Received: from muru.com ([72.249.23.125]:41192 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhJFFJE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:09:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E5EFC80E1;
        Wed,  6 Oct 2021 05:07:42 +0000 (UTC)
Date:   Wed, 6 Oct 2021 08:07:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Drew Fustini <pdp7pdp7@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: Re: [PATCH] soc: ti: omap-prm: Fix external abort for am335x pruss
Message-ID: <YV0u/ot+RJu35Ejz@atomide.com>
References: <20210930080100.56820-1-tony@atomide.com>
 <b7d29bf2-f7b6-1d53-2d59-9c1bb5ee4d84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7d29bf2-f7b6-1d53-2d59-9c1bb5ee4d84@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Matti Vaittinen <mazziesaccount@gmail.com> [210930 11:20]:
> Thanks Tony!
> 
> This was _much_ appreciated :)

Thanks for testing, applying this into fixes.

Regards,

Tony
