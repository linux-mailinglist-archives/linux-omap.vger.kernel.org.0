Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEC23E2A41
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 14:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343517AbhHFMDT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 08:03:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243577AbhHFMDT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 08:03:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67625610C7;
        Fri,  6 Aug 2021 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628251383;
        bh=qDve5wMNtV6JzjL+UP7+g7BUSr+dzrdBtJfd+LudumI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R+tHkmAMK0EK60kJUXRsUOsjHyTD6Y1Ws+zchrMLGB2XYZ+LPu+IUaSXf/r7EsbXV
         IbHX4ijpoV/5J0DXEta/1uCBRuCt1glOzXADgiaQTksaDI870uL2ZP7s0zOWqy25zB
         3RthcSaN39Mhv3GT4IOiyoeaP6Ext+bSFK0PK6sDhrRBdNN9ft1Ftl1tNl6AIF2wPL
         lDsxIEsTbrcsxZoP08vMQXj4KRv5VnLRFUsfJxZM1xdWotvKJCh0OPz+08udMgCTe2
         ecc2ycGtCHNWA3k4Trxf/GDPQfC8bsCuz2Et1sWSD4QnFqIJIGPV+2gLajeTXqRKgN
         VCshoBVevr1fQ==
Date:   Fri, 6 Aug 2021 17:32:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] phy: phy-twl4030-usb: Disable PHY for suspend
Message-ID: <YQ0k8xd6wYkATubB@matsya>
References: <20210727104512.52968-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727104512.52968-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27-07-21, 13:45, Tony Lindgren wrote:
> Since commit 88d26136a256 ("PM: Prevent runtime suspend during system
> resume"), PM runtime will not let devices idle during system suspend.
> 
> This is because of the pm_runtime_get_noresume() call done in
> device_prepare() that is not released until at device_complete() after
> resume.
> 
> We must now disable the USB PHY in suspend if no USB cable is connected.

Applied, thanks

-- 
~Vinod
