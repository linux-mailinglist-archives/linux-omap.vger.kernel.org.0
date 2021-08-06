Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1EE3E2340
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 08:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242299AbhHFG3e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 02:29:34 -0400
Received: from muru.com ([72.249.23.125]:36898 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhHFG3e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 02:29:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 185BE8061;
        Fri,  6 Aug 2021 06:29:38 +0000 (UTC)
Date:   Fri, 6 Aug 2021 09:29:17 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH next 00/15] ARM: dts: am335x: switch rest boards to new
 cpsw switch drv
Message-ID: <YQzWvRXDQkOl08Cz@atomide.com>
References: <20210612011436.10437-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612011436.10437-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210612 04:15]:
> Hi Tony,
> 
> This series converts rest of am335x boards to use new CPSW switchdev driver.
> Only build tested.

Applying into omap-for-v5.15/dt thanks.

Sorry my plan was to apply this series earlier, but looks like I did not
tag the email thread and marked the thread as read.

Anyways, let's plan on merging these assuming no issues based on testing
in Linux next.

Regards,

Tony
