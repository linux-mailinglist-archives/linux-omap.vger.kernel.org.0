Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454809B88F
	for <lists+linux-omap@lfdr.de>; Sat, 24 Aug 2019 00:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405013AbfHWW1u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 18:27:50 -0400
Received: from muru.com ([72.249.23.125]:58510 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbfHWW1u (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 23 Aug 2019 18:27:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 73A0D8161;
        Fri, 23 Aug 2019 22:28:19 +0000 (UTC)
Date:   Fri, 23 Aug 2019 15:27:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: wl1271 broken on am3517-evm on for-next
Message-ID: <20190823222747.GR52127@atomide.com>
References: <CAHCN7xKmQmGBig0k+gwdMax8ojoR+B3aowDOu1FyiNM3gvypKg@mail.gmail.com>
 <20190821113759.GO52127@atomide.com>
 <CAHCN7xJFGuogTXkVuEorNhXwwTVKHUrH8y9YrgTLi86peCYbUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJFGuogTXkVuEorNhXwwTVKHUrH8y9YrgTLi86peCYbUQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190821 13:50]:
> On Wed, Aug 21, 2019 at 6:38 AM Tony Lindgren <tony@atomide.com> wrote:
> > Also, please test (again) with level wlcore interrupt instead of
> > edge. We recent gpio-omap fixes it's starting to look that we can
> > still have edge interrupts lost in retention idle with no status
> > to be seen in the gpio controller. So anything that can be treated
> > as level interrupt probaby should be.
> 
> Currently, it it setup as
> interrupts = <10 IRQ_TYPE_EDGE_RISING>; /* gpio_170 */
> 
> Are you suggesting we go back to
> interrupts = <10 IRQ_TYPE_LEVEL_HIGH>; /* gpio_170 */

If you see wlcore warnings that relate to lost GPIO interrupts
then that should help yeah.

Regards,

Tony
