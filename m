Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDFB3A3CED
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 09:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFKHXu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 03:23:50 -0400
Received: from muru.com ([72.249.23.125]:41762 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229965AbhFKHXt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 03:23:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B650C80BA;
        Fri, 11 Jun 2021 07:22:00 +0000 (UTC)
Date:   Fri, 11 Jun 2021 10:21:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 09/10] bus: ti-sysc: Correct misdocumentation of
 'sysc_ioremap()'
Message-ID: <YMMPDdYvNPSis6HZ@atomide.com>
References: <20210526081038.544942-1-lee.jones@linaro.org>
 <20210526081038.544942-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526081038.544942-10-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [210526 11:11]:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/bus/ti-sysc.c:867: warning: expecting prototype for syc_ioremap(). Prototype was for sysc_ioremap() instead

Picking this patch into omap-for-v5.14/ti-sysc thanks.

Lee and Philipp, if you already have this patch queued elsewhere, please
let me know and I can drop it.

Regards,

Tony
