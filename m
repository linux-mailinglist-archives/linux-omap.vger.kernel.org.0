Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9855D431132
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 09:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhJRHOE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 03:14:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229708AbhJRHOD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Oct 2021 03:14:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BD2760F46;
        Mon, 18 Oct 2021 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634541112;
        bh=YuHQREwHg5QEL8Elw/QVagN7Yj1O6FCyx4TJPRwDUag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Izq04WHZKvoaeWxq2Vfxb0cE6R62itvL4cZseXTS7DGlTZiqRff1NGXQnAghJQWZi
         xy6wCRS7X3XPZL3yIyiz8PXx53bcMFiqIpZTtVYchs7nXdNN4f0Lo2CXkowfTcoycl
         8DM6Xb13/5kIegYAbBnKbbW7bKyEoLfhG+rK2nNfEd4CHiu7DjI3Z2eqVgIq/N7cqn
         OhnrHn+Y7pXv2Qq+4wH+mSUcorP0QArzEp4ka9nd3HktuPv9R25U3glJQ5DHB9SO/H
         8h2CvLAratKMk0nZFPhN8XCDbIpto4+uQoJ8u/OfEKYcoHafaNmOuS5uIK/5JxC7kA
         05DNF5qv/wGtw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mcMoA-0000AO-VJ; Mon, 18 Oct 2021 09:11:43 +0200
Date:   Mon, 18 Oct 2021 09:11:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 0/4] Get rid of pm_runtime_irq_safe() for 8250_omap
Message-ID: <YW0eLr1N15JsCWd9@hovoldconsulting.com>
References: <20211015112626.35359-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015112626.35359-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 15, 2021 at 02:26:22PM +0300, Tony Lindgren wrote:
> Hi,
> 
> Here are v3 patches to get rid of pm_runtime_irq_safe() for the 8250_omap
> driver. Based on comments from Andy, Johan and Greg, I improved a bunch of
> things as listed below.
> 
> For removing the pm_runtime_irq_safe() usage, serial TX is the last
> remaining issue. We deal with TX by waking up the port and returning 0
> bytes written from write_room() and write() if the port is not available
> because of PM runtime autoidle.

Oh, there's a lot more than TX that needs fixing... And I believe the
second sentence no longer applies since v1.

> Chganges since v2:
> 
> - Use locking instead of atomic_t as suggested by Greg
> 
> Changes since v1:
> 
> - Separated out line discipline patches, n_tty -EAGAIN change I still
>   need to retest
> 
> - Changed prep_tx() to more generic wakeup() as also flow control needs it
> 
> - Changed over to using wakeup() with device driver runtime PM instead
>   of write_room()
> 
> - Added runtime_suspended flag for drivers and generic serial layer PM
>   to use

Johan
