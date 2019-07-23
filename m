Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22CE71203
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 08:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730148AbfGWGkm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 02:40:42 -0400
Received: from muru.com ([72.249.23.125]:55556 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727845AbfGWGkm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 02:40:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 312BB808C;
        Tue, 23 Jul 2019 06:41:07 +0000 (UTC)
Date:   Mon, 22 Jul 2019 23:40:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     David Lechner <david@lechnology.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] ARM: OMAP2+: Drop mmc platform data for am330x and
 am43xx
Message-ID: <20190723064038.GP5447@atomide.com>
References: <20190326181324.32140-1-tony@atomide.com>
 <20190326181324.32140-2-tony@atomide.com>
 <0af63198-5a68-2f0d-f14e-2b514580d2d5@lechnology.com>
 <20190722060951.GL5447@atomide.com>
 <20190722075411.GM5447@atomide.com>
 <8427af44-2e28-7e13-3841-15c89d60f6dd@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8427af44-2e28-7e13-3841-15c89d60f6dd@lechnology.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* David Lechner <david@lechnology.com> [190722 14:27]:
> On 7/22/19 2:54 AM, Tony Lindgren wrote:
> > Oh I just noticed this needs to be fixed in v5.2, not in v5.3-rc
> > series. It's best to keep the "ti,hwmods" property still around
> > as there may be dependencies to ti-sysc driver changes in v5.3-rc
> > series for dropping it. Below is a more minimal fix to try.
...

> This fixes wifi on BeagleBone Blue for me in v5.2.
> 
> Tested-by: David Lechner <david@lechnology.com>

OK great, thanks for testing.

Regards,

Tony
