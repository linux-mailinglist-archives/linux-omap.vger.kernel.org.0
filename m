Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB804A7FA5
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 08:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245020AbiBCHL2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 02:11:28 -0500
Received: from muru.com ([72.249.23.125]:45772 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239109AbiBCHL2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 02:11:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 57EBA817C;
        Thu,  3 Feb 2022 07:11:13 +0000 (UTC)
Date:   Thu, 3 Feb 2022 09:11:26 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     peter.vasil@gmail.com
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: leds: Nokia Tahvo/Betty ASIC LEDPWM
 controller
Message-ID: <YfuAHkTSzsX//btS@atomide.com>
References: <20211224214512.1583430-1-peter.vasil@gmail.com>
 <20211224214512.1583430-2-peter.vasil@gmail.com>
 <Yft/K56SiK472But@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yft/K56SiK472But@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [220203 07:07]:
> * peter.vasil@gmail.com <peter.vasil@gmail.com> [211224 21:53]:
> > From: Peter Vasil <peter.vasil@gmail.com>
> > 
> > One of the functions of Tahvo/Betty ASIC MFD chip is a PWM output able
> > to drive LED with 127 levels of brightness.
> > On Nokia N8x0 Internet Tablet devices, this controls the LCD backlight.
> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Just noticed that the binding patches should be sent to Rob Herring
and devicetree list for merging. Please take a look at the MAINTAINERS
file for details and resend :)

Regards,

Tony
