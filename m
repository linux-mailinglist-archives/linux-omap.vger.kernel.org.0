Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C30415EBF
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 14:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241052AbhIWMsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 08:48:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241090AbhIWMrY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Sep 2021 08:47:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D9D06115A;
        Thu, 23 Sep 2021 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632401152;
        bh=MOEoOm0A6Knk1Gx88rLXlWQqwc5poz0/5WU4cVxmfVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EAMMIvVO0qp0vY0Vp9vAxvSbYybtNM3d6vzy+t/43GrnCw0mncqpK4bLiTm/8kCdl
         VjZQSg/zSvCoQFx3H9X/9ub9GHVKCN206xXyXEevjxX0XV5zJ/tVsEBu7qPr7Bawjo
         DcbkKNaNSc8LDd9cqokx1CEEyPFjBmRq5Hb/gi4LCYzlyFsYyfJA82t4lcCSzrlgo+
         jeJaN/eCFzQV0WFEydlm5e1H5ZYhPlwA/+/pS/PqmEAxPPryp7ofzRfkXnYVSs2E56
         dNX17V7bAG+D8/ywwGfUTw6YdDV4V6xsB0fkV4cmvTWRySFmRpX5E3gy+ykk+XID/p
         5pH+XcgKYwsLQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTO6s-0001ay-7w; Thu, 23 Sep 2021 14:45:54 +0200
Date:   Thu, 23 Sep 2021 14:45:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] serial: core: Add new prep_tx for power management
Message-ID: <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921103346.64824-4-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 21, 2021 at 01:33:43PM +0300, Tony Lindgren wrote:
> If the serial driver implements PM runtime with autosuspend, the port may
> be powered off for TX. To wake up the port, let's add new prep_tx() call
> for serial drivers to implement as needed. We call it from serial
> write_room() and write() functions. If the serial port is not enabled,
> we just return 0.

This isn't right. If there's room in the driver buffer, there's no
reason to not accept those characters.

It's the drivers responsibility to resume writing when write() is
called and that me need to be done in a runtime resume callback in case
the device is suspended.

No need to be patching line disciplines for this.

Johan
