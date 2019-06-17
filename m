Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF26748171
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2019 14:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfFQMBC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Jun 2019 08:01:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40368 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfFQMBC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Jun 2019 08:01:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so9009199ljh.7
        for <linux-omap@vger.kernel.org>; Mon, 17 Jun 2019 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1hxMvr3AFMBt/2KDCsNWa1jyIIc9m7a7I03nJY/RIlI=;
        b=ZLJgvKf4ch9jOUgy8gLGHbioq3uYLN0at1dSCYd4HdoN3e+QgDutShCB3hI+h6cmxJ
         pwxS0S6cYBFkv05Mcn9UeevqOH8HXKJgeLN0KIec5sTNuJCQBru3bumtFT6HOuCNYnpX
         J05t4qhnfW64GyGKW5iEkuS/lzsKvvdH8TaBMaHzC8kDBybUiEW9SO1nepPiUjTgccpe
         IYG8/NRY+VwhSs1UHAUXTZ10Rlso+pbp1qwZXbTvL3v2szVw3kcCnwr7lyVg9exCOSYC
         LcBfSp5MZ+QUV739E1O6KfyGyKDrFVdb/GunT9fMRusyd0y08WjJrrlqKM5QdhiCk52j
         jaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hxMvr3AFMBt/2KDCsNWa1jyIIc9m7a7I03nJY/RIlI=;
        b=dH1cVdq67xttNThBEthtKoEodx8MPf+43O9eN5uK3YuZz18RTgtHOwueHvN42iLi5Z
         iQtl/oW2op9N9bXYK2cJbvFy3Jk7HDcjikp/4kmXLp8CV2k+OUrvw1IXfMPiQ0P4bn5Q
         nafGbyZghFk6t6CFDt8YGriHuQNPZe1A1gotmoa5qKxYXG/DRviwVCNLun/56lHX9J7+
         o0tyhVjaosAiiFS38ee2NMtBnQamk8vBW2EKJZ5YIY7B9N1R6gBx6o2esef3IKEB+eRb
         I6j9o7nyibVVuf4apzuLr/nw6irsJOM+Po2uedKjKt36aGl43Ha7xoUbYa7Ody6YVTom
         sv6A==
X-Gm-Message-State: APjAAAVGMQHc2R1bsJmCrowxqsmH3HGuhEt0lVQTTQVjRJr6f1sxXsS4
        d6PId6P7rnWV9k50+w2C3erB1Q==
X-Google-Smtp-Source: APXvYqwcBLgdw5efzzeHm6rpocFnUVn9FdBNfs/iye4cCSJhoeAKZDLuJueacDyMzloq/O1LygASjQ==
X-Received: by 2002:a2e:995a:: with SMTP id r26mr18949264ljj.107.1560772859708;
        Mon, 17 Jun 2019 05:00:59 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id q13sm1732255lfk.65.2019.06.17.05.00.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 05:00:58 -0700 (PDT)
Date:   Mon, 17 Jun 2019 04:53:52 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/4] ti-sysc driver changes for v5.3
Message-ID: <20190617115352.enwk67aca57fm3im@localhost>
References: <pull-1560399818-512977@atomide.com>
 <pull-1560399818-512977@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1560399818-512977@atomide.com-3>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 13, 2019 at 12:10:52AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:
> 
>   Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/ti-sysc-signed
> 
> for you to fetch changes up to 4e23be473e3063a9d3bc06bb0aee89885fffab0e:
> 
>   bus: ti-sysc: Add support for module specific reset quirks (2019-06-10 04:52:22 -0700)
> 
> ----------------------------------------------------------------
> ti-sysc interconnect target module driver changes for v5.3
> 
> This series of changes improves probing devices with ti-sysc to the
> point where we can now probe most devices without the custom dts
> property "ti,hwmods" and no legacy platform data :)
> 
> We add support for platform data callbacks for idling and unidling the
> clockdomain the module belongs to. The rest of the series mostly adds
> handling for the various quirks needed by old legacy modules such as
> i2c and watchdog. Some quirk handling is still missing for few modules,
> but those will be added as they get tested.
> 
> The related platform data and dts changes will be sent separately.

Merged, thanks!


-Olof
