Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B084412FCE
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 09:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhIUH5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 03:57:03 -0400
Received: from muru.com ([72.249.23.125]:35356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhIUH5C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 03:57:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7922B80A8;
        Tue, 21 Sep 2021 07:56:02 +0000 (UTC)
Date:   Tue, 21 Sep 2021 10:55:33 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kishon Vijay Abraham <kishon@ti.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix external abort for am335x pruss probe
Message-ID: <YUmP9avkWbsIZmBE@atomide.com>
References: <20210915065032.45013-1-tony@atomide.com>
 <3fd1968e-491e-6d98-ec9c-d29baed3158f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd1968e-491e-6d98-ec9c-d29baed3158f@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [210916 16:55]:
> Let me take a look at this during the weekend. I did verify the AM335x PRUSS
> when I posted the dts patches on 5.14-rc. You should be able to check as well
> from your staging branch with PRUSS patches.

FYI, I just posted what might be a better fix and a test script in thread
"beaglebone black boot failure Linux v5.15.rc1".

Regards,

Tony
