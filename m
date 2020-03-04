Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D91A179562
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 17:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgCDQeR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 11:34:17 -0500
Received: from muru.com ([72.249.23.125]:58790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgCDQeR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Mar 2020 11:34:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5988F80F5;
        Wed,  4 Mar 2020 16:35:01 +0000 (UTC)
Date:   Wed, 4 Mar 2020 08:34:12 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: OMAP: replace setup_irq() by request_irq()
Message-ID: <20200304163412.GX37466@atomide.com>
References: <20200301121945.3604-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200301121945.3604-1-afzal.mohd.ma@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* afzal mohammed <afzal.mohd.ma@gmail.com> [200301 04:20]:
> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> occur after memory allocators are ready.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
> ---
> Hi sub-arch maintainers,
> 
> If the patch is okay, please take it thr' your tree.

Thanks applied into omap-for-v5.7/omap1.

Regards,

Tony
