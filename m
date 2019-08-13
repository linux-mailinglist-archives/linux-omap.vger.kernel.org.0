Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605138B76B
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 13:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfHMLqX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 07:46:23 -0400
Received: from muru.com ([72.249.23.125]:57204 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbfHMLqX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 07:46:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4D757805C;
        Tue, 13 Aug 2019 11:46:51 +0000 (UTC)
Date:   Tue, 13 Aug 2019 04:46:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] ARM: dts: omap3-n950-n9: Remove regulator-boot-off
 property
Message-ID: <20190813114620.GS52127@atomide.com>
References: <20190721232455.13709-1-ezequiel@collabora.com>
 <20190721232455.13709-2-ezequiel@collabora.com>
 <20190723015342.vc2hybovozfmeekj@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723015342.vc2hybovozfmeekj@earth.universe>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [190723 01:54]:
> Hi,
> 
> On Sun, Jul 21, 2019 at 08:24:55PM -0300, Ezequiel Garcia wrote:
> > This property was never supported upstream. Get rid of it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Applying both patches into omap-for-v5.4/dt thanks.

Tony
