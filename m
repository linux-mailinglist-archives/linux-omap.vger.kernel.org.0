Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA95BB5836
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 00:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfIQWra (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 18:47:30 -0400
Received: from muru.com ([72.249.23.125]:33590 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727011AbfIQWra (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Sep 2019 18:47:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7FC4880F6;
        Tue, 17 Sep 2019 22:48:00 +0000 (UTC)
Date:   Tue, 17 Sep 2019 15:47:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP Maintainers
Message-ID: <20190917224722.GA5610@atomide.com>
References: <CAHCN7xL-DOtFg-o8JFvfGWHJCo4Jh7Qtaf8CoRxWmq_9aRRroQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xL-DOtFg-o8JFvfGWHJCo4Jh7Qtaf8CoRxWmq_9aRRroQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190917 17:36]:
> Tony,
> 
> I was noticing the maintainers file lists a bunch of stuff that goes
> through your branch
> 
> OMAP DEVICE TREE SUPPORT
> M: Benoît Cousson <bcousson@baylibre.com>
> M: Tony Lindgren <tony@atomide.com>
> L: linux-omap@vger.kernel.org
> L: devicetree@vger.kernel.org
> S: Maintained
> F: arch/arm/boot/dts/*omap*
> F: arch/arm/boot/dts/*am3*
> F: arch/arm/boot/dts/*am4*
> F: arch/arm/boot/dts/*am5*
> F: arch/arm/boot/dts/*dra7*
> 
> 
> Unfortunately, none of the logicpd-torpedo/som-lv files fit this format.
> 
> Are you OK if I submit a patch to include them in your maintainer table?

Sure makes sense to me.

Thanks,

Tony
