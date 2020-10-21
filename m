Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73116294780
	for <lists+linux-omap@lfdr.de>; Wed, 21 Oct 2020 06:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440264AbgJUEvy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Oct 2020 00:51:54 -0400
Received: from muru.com ([72.249.23.125]:46352 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440263AbgJUEvy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 21 Oct 2020 00:51:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C558880B0;
        Wed, 21 Oct 2020 04:51:57 +0000 (UTC)
Date:   Wed, 21 Oct 2020 07:51:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Dev Null <devnull@uvos.xyz>, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/1] power: supply: cpcap-battery: improve handling of
 3rd party and XT875 batteries.
Message-ID: <20201021045145.GA5974@atomide.com>
References: <20201020225312.b4ea29c9dc3ae00f23e39280@uvos.xyz>
 <20201020214126.tkf37xpehnpxli4a@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020214126.tkf37xpehnpxli4a@earth.universe>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Sebastian Reichel <sre@kernel.org> [201020 21:41]:
> The context of this patch is not available in cpcap-battery driver
> from mainline. So this has dependencies on other patches, which
> need to be submitted first. I currently do not have any pending
> cpcap patches, but IIRC there was a big patchset which had to be
> resubmitted.

Yes this $subject patch as a split up series should be based on
the mainline kernel, and not on the WIP battery capacity patches.
I doubt there will be any severe rebase issues for the capacity
patches.

FYI, I'm slowly working on the battery capacity series but still
need to decouple the battrery full status from charge current as
that won't work for cases where we have CPU load :) We just need
to set the status based on charger full interrupt.

Regards,

Tony
