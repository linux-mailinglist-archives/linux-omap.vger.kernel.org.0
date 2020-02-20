Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57ED6166573
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 18:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgBTRxi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 12:53:38 -0500
Received: from muru.com ([72.249.23.125]:56414 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbgBTRxi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 12:53:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1D55F8080;
        Thu, 20 Feb 2020 17:54:23 +0000 (UTC)
Date:   Thu, 20 Feb 2020 09:53:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7-l4: mark timer13-16 as pwm capable
Message-ID: <20200220175335.GP37466@atomide.com>
References: <20200219162126.28671-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219162126.28671-1-grygorii.strashko@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [200219 08:22]:
> DMTimers 13 - 16 are PWM capable and also can be used for CPTS input
> signals generation. Hence, mark them as "ti,timer-pwm".

Applying into fixes thanks.

Tony
