Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983CC3F13A1
	for <lists+linux-omap@lfdr.de>; Thu, 19 Aug 2021 08:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhHSGgp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Aug 2021 02:36:45 -0400
Received: from muru.com ([72.249.23.125]:48822 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhHSGgo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Aug 2021 02:36:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8F84580C7;
        Thu, 19 Aug 2021 06:36:30 +0000 (UTC)
Date:   Thu, 19 Aug 2021 09:36:07 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     Pavel Machek <pavel@denx.de>, Nishanth Menon <nm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: ti-sysc: Fix error handling for
 sysc_check_active_timer()
Message-ID: <YR3710C+ROYblg5q@atomide.com>
References: <20210811061053.32081-1-tony@atomide.com>
 <20210811062231.GA16241@duo.ucw.cz>
 <d9ebbc7f-07f1-160f-f463-7c54ed8dd6d7@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ebbc7f-07f1-160f-f463-7c54ed8dd6d7@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210815 18:13]:
> I double checked but actually both plain 0aa78d17099b ("Merge tag
> 'scsi-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi") and with this
> patch boot fine on my Beagle C2.
> 
> Anyway,
> 
> Tested-by: jarkko.nikula@bitmer.com

OK thanks for testing. I had already pushed out my fixes branch so
I did not want to go back to add the Tested-by. Anyways, a pull
request for this has been sent now.

Regards,

Tony
