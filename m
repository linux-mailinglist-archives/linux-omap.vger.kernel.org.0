Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEDC2E8337
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jan 2021 07:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhAAGHR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 1 Jan 2021 01:07:17 -0500
Received: from muru.com ([72.249.23.125]:40680 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbhAAGHR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 Jan 2021 01:07:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 55E9E803A;
        Fri,  1 Jan 2021 06:06:51 +0000 (UTC)
Date:   Fri, 1 Jan 2021 08:06:32 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: motorola-mapphone: Add 1.2GHz OPP
Message-ID: <20210101060632.GI26857@atomide.com>
References: <20201230084232.19221-1-tony@atomide.com>
 <20201230084232.19221-3-tony@atomide.com>
 <20201231094315.GB22962@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201231094315.GB22962@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [201231 09:43]:
> I'm pretty sure it is GHz, not GiHz.

Oops right, will fix.

> > +        operating-points = <
> > +	        /* kHz    uV */
> > +	        300000  1025000
> > +	        600000  1200000
> > +	        800000  1313000
> > +	        1008000 1375000
> > +		1200000 1375000
> > +        >;
> 
> Is it intended to be 1.008GHz, or is it a typo?

The "1008000 1375000" is already there for 4430 in general, we now
add also add "1200000 1375000" but only for moto devices that have
it tested. The voltage used is the same in both cases.

The rates come from what's available from dpll_mpu_ck without
reprogramming the dpll.

Regards,

Tony
