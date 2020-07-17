Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C1922308C
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 03:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgGQBmI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jul 2020 21:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgGQBmI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jul 2020 21:42:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42F3C061755
        for <linux-omap@vger.kernel.org>; Thu, 16 Jul 2020 18:42:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so9254469wrl.8
        for <linux-omap@vger.kernel.org>; Thu, 16 Jul 2020 18:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ykpb6rMFmfbd8HrxgvzsFXXnQ8AhGx3AHAH8NFaAV+I=;
        b=NXT3zFuzFhZF6Z5eHkOu6TZbsOmBmaGFhfGRBFNy+ydW3PW6POkHprUFePFvgjQX8x
         UMeq3KpPF8Z9qVhqKaBTi5W3oO7OMkPNT9wbsE8zzGslfLoI0ifcYYlODQhItnRfpXqe
         jbb2Y5/+HJJmKYgO8NysdQ7ywPUecVdeVvFnW0kBHWQjNyfsLM5SW9oSg25P+kSWOX6N
         uKv9E1/OhCmhSlsElsRRsIspaDof4AuVjftxaQz180DdDY2ATjV+cKxlCg8W3fnaaQmi
         SjIdrwqfLUuDes26uXhJhU/FyYUIvmkONUP/MHqJBe6EU3FtGk1FrvpWbsFzGkvpXIIA
         fqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ykpb6rMFmfbd8HrxgvzsFXXnQ8AhGx3AHAH8NFaAV+I=;
        b=Re+w8NhJtJKKgr8eEbS67mehx0r8cfEO3QhGnpI3/qyp6EytIneg6k8hCQP1z3rW9v
         cYyMt9TGgmV/SiwuPNqwfnlFnr6mIOHYKf8ZdT2n7OQrK6i9Vgu4ryid4/N5xNEBSXEx
         0aADabt9d/umZu3eHVbP0K53O+5zDXBhHBb09LsCuTTbH5B9q7HLV5rnFbwz9S4a30ii
         +XnOPB8MURafH/0tJXpEdpcn4uouhWvLxC7hXX15t2EyTMyTtSSZdTJ7/vliQuUmX9zP
         k7GZcCQmVkiuYIRRvtP/o1xYKiowQ7tAMiCxz6yPffRpyilYoml7EbGdnFpy3ZjstJNz
         lrlQ==
X-Gm-Message-State: AOAM531lu/TXNlNACeMOPL+qEaNnnMB7VGEWAbY2+ElCGwRQEZwpby7u
        jhYyuig0OlhiaQSRdFP8dUSrAJKMYzvb2g==
X-Google-Smtp-Source: ABdhPJxCwpLqv7ORogtKl4hDE9yZI/kuzcZNAiBPa8/7oyyZ64tsoyaVvP2SRplnune5fLruYUOccA==
X-Received: by 2002:adf:de0a:: with SMTP id b10mr7639501wrm.72.1594950126123;
        Thu, 16 Jul 2020 18:42:06 -0700 (PDT)
Received: from x1 (220.red-95-125-197.staticip.rima-tde.net. [95.125.197.220])
        by smtp.gmail.com with ESMTPSA id v5sm10920770wmh.12.2020.07.16.18.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 18:42:05 -0700 (PDT)
Date:   Fri, 17 Jul 2020 03:42:02 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
Message-ID: <20200717014202.GA1747088@x1>
References: <20200625002736.GA24954@x1>
 <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
 <20200712215630.GA1298162@x1>
 <20200713150220.GJ5849@atomide.com>
 <20200713174747.GA1424108@x1>
 <20200713180519.GN5849@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713180519.GN5849@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 13, 2020 at 11:05:19AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200713 17:47]:
> > Do you mean you would like to see the mapping added as a column in the pins file?
> > 
> > debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
> > registered pins: 142
> > pin 0 (PIN0) 44e10800 00000027 pinctrl-single
> > pin 1 (PIN1) 44e10804 00000027 pinctrl-single
> > pin 2 (PIN2) 44e10808 00000027 pinctrl-single
> > pin 3 (PIN3) 44e1080c 00000027 pinctrl-single
> > pin 4 (PIN4) 44e10810 00000027 pinctrl-single
> > pin 5 (PIN5) 44e10814 00000027 pinctrl-single
> > pin 6 (PIN6) 44e10818 00000027 pinctrl-single
> > pin 7 (PIN7) 44e1081c 00000027 pinctrl-single
> > pin 8 (PIN8) 44e10820 00000027 pinctrl-single
> > 
> > So that could be:
> > 
> > debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
> > registered pins: 142
> > pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
> > pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
> > pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
> > pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
> > pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
> > pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
> > pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
> > pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
> > pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
> 
> Yes that would make the debugfs output more understandable and
> easier to use.

I have posted a patch [0] to add the GPIO-xx column to the pins file.

Thanks,
Drew

[0] https://lore.kernel.org/linux-gpio/20200717013338.1741659-1-drew@beagleboard.org/
