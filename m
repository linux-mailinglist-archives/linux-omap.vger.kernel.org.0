Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD982BF25
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbfE1GQT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:16:19 -0400
Received: from muru.com ([72.249.23.125]:51332 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfE1GQT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:16:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 49DC380F3;
        Tue, 28 May 2019 06:16:37 +0000 (UTC)
Date:   Mon, 27 May 2019 23:16:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/12] ti-sysc driver changes to drop custom hwmods
 property
Message-ID: <20190528061614.GL5447@atomide.com>
References: <20190527121348.45251-1-tony@atomide.com>
 <380809b1-7152-faa5-9f43-2243fb4dad19@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380809b1-7152-faa5-9f43-2243fb4dad19@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190528 00:58]:
> 
> 
> On 27/05/19 5:43 PM, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here are changes to improve ti-sysc driver to the point where we can
> > finally drop the custom hwmods property for most cases. This series
> > drops hwmods property only for omap4 UART and MMC as those can be
> > tested with core retention idle.
> > 
> > I'll be posting more patches for dropping hwmods properties as they
> > get tested.
> 
> Tony,
> 
> What is the base of this series? It does not apply cleanly neither on
> linux-next nor on top of 5.2->rc1. If there are dependencies do you have a
> branch?

Oh thanks for letting me know. It's against v5.2-rc1 but the first
patch of the series got accidentally left out. Looks like I used -n
option with git format-patch with -n 12 instead of -n13. I will
repost the series.

Regards,

Tony
