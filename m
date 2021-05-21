Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC89D38BDEB
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 07:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhEUFiF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 01:38:05 -0400
Received: from muru.com ([72.249.23.125]:58202 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhEUFiF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 01:38:05 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6960880A3;
        Fri, 21 May 2021 05:36:46 +0000 (UTC)
Date:   Fri, 21 May 2021 08:36:38 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org
Subject: Re: Random stack corruption on v5.13 with dra76
Message-ID: <YKdG5rsNCRYVLDpj@atomide.com>
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
> Hi,
> 
> I've noticed that the v5.13 rcs crash randomly (but quite often) on dra76 evm
> (I haven't tested other boards). Anyone else seen this problem?

I have not seen this so far and beagle-x15 is behaving for me.

Does it always happen on boot?

Regards,

Tony
