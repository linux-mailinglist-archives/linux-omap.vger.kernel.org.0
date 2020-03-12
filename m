Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99C318292A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Mar 2020 07:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387967AbgCLGfl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Mar 2020 02:35:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43989 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387786AbgCLGfl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Mar 2020 02:35:41 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jCHRT-0007UG-Vv; Thu, 12 Mar 2020 07:35:39 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jCHRT-0003U7-3k; Thu, 12 Mar 2020 07:35:39 +0100
Date:   Thu, 12 Mar 2020 07:35:39 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/5] pwm: omap-dmtimer: Drop unused header file
Message-ID: <20200312063539.5urgly7scgupqqwi@pengutronix.de>
References: <20200312042210.17344-1-lokeshvutla@ti.com>
 <20200312042210.17344-2-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200312042210.17344-2-lokeshvutla@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Mar 12, 2020 at 09:52:06AM +0530, Lokesh Vutla wrote:
> pwm_omap_dmtimer.h is used only:
> - to typedef struct omap_dm_timer to pwm_omap_dmtimer
> - for macro PWM_OMAP_DMTIMER_TRIGGER_OVERFLOW_AND_COMPARE
> Rest of the file is pretty mush unsed. So reuse omap_dm_timer
> and OMAP_TIMER_TRIGGER_OVERFLOW_AND_COMPARE in pwm-omap-dmtimer.c
> and delete the header file.
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Acked-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
