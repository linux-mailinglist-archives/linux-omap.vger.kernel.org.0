Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA63A2B8E8B
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 10:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgKSJSd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 04:18:33 -0500
Received: from muru.com ([72.249.23.125]:48680 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgKSJSc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 04:18:32 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ADF8D80C1;
        Thu, 19 Nov 2020 09:18:37 +0000 (UTC)
Date:   Thu, 19 Nov 2020 11:18:27 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: suppress err msg for timers used as
 clockevent/source
Message-ID: <20201119091827.GG26857@atomide.com>
References: <20201118141900.25063-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118141900.25063-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [201118 14:19]:
> GP Timers used as clockevent/source are not available for ti-sysc bus and
> handled by Kernel timekeeping core. Now ti-sysc produces error message
> every time such timer is detected:
> 
>  "ti-sysc: probe of 48040000.target-module failed with error -16"
> 
> Such messages are not necessary, so suppress them by returning -ENXIO
> instead of -EBUSY.

Thanks applying into fixes.

Tony
