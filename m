Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCB12642E7
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 11:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgIJJxY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 05:53:24 -0400
Received: from muru.com ([72.249.23.125]:44526 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730553AbgIJJvy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 05:51:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A9A1980F9;
        Thu, 10 Sep 2020 09:51:54 +0000 (UTC)
Date:   Thu, 10 Sep 2020 12:52:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH next 0/6] ARM: dts: am57xx/dra7x: switch to new cpsw
 switch drv
Message-ID: <20200910095237.GE7101@atomide.com>
References: <20200907202125.22943-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907202125.22943-1-grygorii.strashko@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [200907 23:21]:
> Hi Tony,
> 
> Since Kernel v5.5 commits:
>  111cf1ab4da3 ("net: ethernet: ti: introduce cpsw switchdev based driver part 2 - switch")
>  ed3525eda4c4 ("net: ethernet: ti: introduce cpsw switchdev based driver part 1 - dual-emac")
> the new CPSW driver with switchdev support has been introduced and one
> am571x-idk board was converted to use it. And since that time (Nov 2019) no
> significant issues were reported for the new CPSW driver.
> 
> Therefore it's time to switch all am57xx/dra7x boards to use new cpsw switch
> driver. Those boards have 1 or 2 Ext. port wired and configured in dual_mac mode
> by default. The dual_mac mode has been preserved the same way between
> legacy and new driver it's safe to switch drivers.

OK thanks applying into omap-for-v5.10/dt.

Tony
