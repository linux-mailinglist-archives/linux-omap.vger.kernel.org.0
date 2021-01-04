Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D874D2E910E
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jan 2021 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbhADHaw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jan 2021 02:30:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:56958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727810AbhADHav (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 Jan 2021 02:30:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37FB4207B7;
        Mon,  4 Jan 2021 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609745411;
        bh=kJ7tIx6+r+VyiiZ+ckZqxiWwz7LaTSEHsosRPI74mwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TvKUHELzK09cVV7YTMf2uNBplAB+TpYL8TZihmmi2JOUd9ed/PCiypfClJThTIJKp
         TEew1m94iiR99Ok/ewIWmxUBrrl4TxTB8y5XV8TA43wTj8e0Qd00Q8e5WAOIsv3Of5
         K8kJp1aZEbt24M2WdH8qpZAyhhhjSWACQtV8oDFH1BxRm+2n32s41bxopmvppZ2ufq
         or/OQ/E2H+AQCsmXRI45GOg4n/s0ntKj6TMmCs/f9+JIVJOYlPRHLrXzYQWNl2Zst0
         ALtBv8dRNG/7KhE6lHKsktfR8yGbhzeRaJVguBOBXUoZBKMvl3OvHWHvwblmDt8xLl
         iJtHWH7Z749xA==
Date:   Mon, 4 Jan 2021 13:00:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] phy: cpcap-usb: Fix warning for missing regulator_disable
Message-ID: <20210104073006.GE120946@vkoul-mobl>
References: <20201230102105.11826-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230102105.11826-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30-12-20, 12:21, Tony Lindgren wrote:
> On deferred probe, we will get the following splat:
> 
> cpcap-usb-phy cpcap-usb-phy.0: could not initialize VBUS or ID IIO: -517
> WARNING: CPU: 0 PID: 21 at drivers/regulator/core.c:2123 regulator_put+0x68/0x78
> ...
> (regulator_put) from [<c068ebf0>] (release_nodes+0x1b4/0x1fc)
> (release_nodes) from [<c068a9a4>] (really_probe+0x104/0x4a0)
> (really_probe) from [<c068b034>] (driver_probe_device+0x58/0xb4)

Applied, thanks

-- 
~Vinod
