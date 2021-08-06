Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526B03E2346
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 08:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbhHFGbx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 02:31:53 -0400
Received: from muru.com ([72.249.23.125]:36910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhHFGbw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 02:31:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8A3508061;
        Fri,  6 Aug 2021 06:31:56 +0000 (UTC)
Date:   Fri, 6 Aug 2021 09:31:35 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] ARM: dts: am335x-bone: switch to new cpsw switch drv
Message-ID: <YQzXR19MOwrJFL2S@atomide.com>
References: <20210805230956.7379-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805230956.7379-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210806 02:10]:
> The dual_mac mode has been preserved the same way between legacy and new
> driver, and one port devices works the same as 1 dual_mac port - it's safe
> to switch drivers.
> 
> So, Switch BeagleBone boards to use new cpsw switch driver. Those boards
> have or 2 Ext. port wired and configured in dual_mac mode by default, or
> only 1 Ext. port.
> 
> For am335x-sancloud-bbe-common.dtsi also removed duplicated davinci_mdio DT
> nodes which already defined in am335x-bone-common.dtsi.

Applying this too into omap-for-v5.15/dt.

Regards,

Tony
