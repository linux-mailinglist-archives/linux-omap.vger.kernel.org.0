Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F29E24A7F9A
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 08:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242050AbiBCHHZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 02:07:25 -0500
Received: from muru.com ([72.249.23.125]:45754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237239AbiBCHHY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 02:07:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 18428817C;
        Thu,  3 Feb 2022 07:07:10 +0000 (UTC)
Date:   Thu, 3 Feb 2022 09:07:23 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     peter.vasil@gmail.com
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: leds: Nokia Tahvo/Betty ASIC LEDPWM
 controller
Message-ID: <Yft/K56SiK472But@atomide.com>
References: <20211224214512.1583430-1-peter.vasil@gmail.com>
 <20211224214512.1583430-2-peter.vasil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224214512.1583430-2-peter.vasil@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* peter.vasil@gmail.com <peter.vasil@gmail.com> [211224 21:53]:
> From: Peter Vasil <peter.vasil@gmail.com>
> 
> One of the functions of Tahvo/Betty ASIC MFD chip is a PWM output able
> to drive LED with 127 levels of brightness.
> On Nokia N8x0 Internet Tablet devices, this controls the LCD backlight.

Reviewed-by: Tony Lindgren <tony@atomide.com>
