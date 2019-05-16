Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4B91FFC0
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 08:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfEPGnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 02:43:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42215 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbfEPGnz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 02:43:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id 188so1981873ljf.9
        for <linux-omap@vger.kernel.org>; Wed, 15 May 2019 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ierxK4ZQGi+aWEa2Ph1i719XCDGMZKo2rMWZhKVF1Dw=;
        b=hrG6wbDepq3YTtYbip3mTp/54Elj7pE2elU5/5rzyMZPdN3EY3isKNgqbk9GBvEJwZ
         BsEYXk5CMKoKdJkaldGmdmQ1HLRxTq3ZE2ifAMHC/Toni7Oi3r/+G0T6WsUmqNGR9/aL
         Z4FogoliR0ubby3thG5/XdUE7P5gg5bX5O6oCJagpIWfHAjFlKNqEUZDXOv7FmNNjbF1
         knveOMK21X7xZBDx8xTTxLaWZO3Uky4s8S4nDaNqPWr1qx7O73bpf3He8fzeGkIlldI0
         7R/fV2kRFxZ0JKd8vxsMbeFXperTfXoO8WUwqOQpudmP9epCOcC/AljmzWPjOH9pVYCw
         UU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ierxK4ZQGi+aWEa2Ph1i719XCDGMZKo2rMWZhKVF1Dw=;
        b=ntFzNNzz0rN+U2ou8JwnviX/9mSP3ym2cIAIDXs7Q/DA1DYxPbxA7Ky2CVlHDM8E5S
         ZfHNBJpX2/irAxTkrvoyCMG28H6ULsDsjrRWKwQMCxrqERROk/Puotx5T26WcJ+4ZMkJ
         T+LjumPDt3zkNuSYzTl3zP70x4Cqh1kW1cZByWK+I/KjLJjH3mivNaiwDuEDlnt5Hjua
         2ANYMmpKvwrMaXbkLZ8YiG25j+uAKHV82rQoS8WT8vIY3vgn6/yjI4Hpr9lcdNtn/3vB
         zIO+l76ikrpK8rm6IGCPlVdTqHPZkH4N9lxTRztaV3mb7xKlMfv1Vm8XcEFcqracPy3x
         6PBQ==
X-Gm-Message-State: APjAAAWr5c9jgd8KmCvjs39/CsdaMEI4gqdBdUxyhTZUvV8Po8UqzHLR
        7AFl+YUN3aOnv4RKfBHiPREtBw==
X-Google-Smtp-Source: APXvYqxkryLRV88jfKs2gdlozGt/U8xEDox58X7vzcMh7YV9aLILewaecxKOwUn+g02nJT8W1mn2cw==
X-Received: by 2002:a2e:d1a:: with SMTP id 26mr22896184ljn.147.1557989033442;
        Wed, 15 May 2019 23:43:53 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id y3sm776722lfh.12.2019.05.15.23.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 23:43:52 -0700 (PDT)
Date:   Wed, 15 May 2019 23:23:16 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] two fixes for omaps
Message-ID: <20190516062316.3amk72lykcmugnyu@localhost>
References: <pull-1556727306-300309@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1556727306-300309@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 01, 2019 at 09:15:36AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 81717283cf2c4c4d9bf8fd618cd6e5bdfe082edd:
> 
>   Merge commit '7d56bedb2730dc2ea8abf0fd7240ee99ecfee3c9' into omap-for-v5.1/fixes (2019-04-01 09:36:25 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.1/fixes-rc6
> 
> for you to fetch changes up to 6a38df676a0a06bfc7ff8607ac62ccd6d95969ad:
> 
>   ARM: dts: logicpd-som-lv: Fix MMC1 card detect (2019-04-30 08:49:25 -0700)
> 
> ----------------------------------------------------------------
> Two regression fixes for omaps
> 
> Two one-liners to fix board-ams-delta booting regression and
> logicpd-som-lv MMC card detect to use GPIO_ACTIVE_LOW instead of
> IRQ_TYPE_LEVEL_LOW. Note that the board-ams-delta regression has
> been in there already since v5.0, so if necessary these can wait
> for the merge window.

Merged into arm/late for 5.2. Thanks!


-Olof
