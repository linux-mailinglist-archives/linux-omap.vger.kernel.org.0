Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522E930ECDF
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 08:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhBDHBG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 02:01:06 -0500
Received: from muru.com ([72.249.23.125]:56986 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhBDHBG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Feb 2021 02:01:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 12F3D80C5;
        Thu,  4 Feb 2021 07:00:36 +0000 (UTC)
Date:   Thu, 4 Feb 2021 09:00:21 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org,
        Carl-Oscar Varnander 
        <carl-oscar.varnander@hitachi-powergrids.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD
Message-ID: <YBubhS4NprkdPcDM@atomide.com>
References: <20210128191548.4376-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128191548.4376-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210128 21:16]:
> The main purpose of l3 IRQs is to catch OCP bus access errors and identify
> corresponding code places by showing call stack, so it's important to
> handle L3 interconnect errors as fast as possible. On RT these IRQs will
> became threaded and will be scheduled mach more late from the moment actual
> error occurred so showing completely useless information.
> 
> Hence, mark l3 IRQs as IRQF_NO_THREAD so they will not be forced threaded
> on RT or if force_irqthreads = true.
> 
> Fixes: 0ee7261c9212 ("drivers: bus: Move the OMAP interconnect driver to drivers/bus/")

Thanks applying into fixes.

Tony
