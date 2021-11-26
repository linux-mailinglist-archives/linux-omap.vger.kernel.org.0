Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF58C45F15C
	for <lists+linux-omap@lfdr.de>; Fri, 26 Nov 2021 17:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378308AbhKZQPn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Nov 2021 11:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378134AbhKZQNm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Nov 2021 11:13:42 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C0BC061397;
        Fri, 26 Nov 2021 08:02:21 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id g14so40776436edb.8;
        Fri, 26 Nov 2021 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myqzowoy6VgYIDOrHd/LfS2qrNQNfPA8OZoTCY9iRLs=;
        b=eWMa8/Zz/lsgGtgQQJRo+PL2P/cdc+hDYyB1vW32kPmybARSeE8xncVLmPmf0huuhP
         yo5zRaqiI2ynENTTxf+JF1ZL/Y/MeWSakDo8r8MyUl1+eNG/YbFDnOzgwmXF3wFHG1Zu
         JJJa8zwrknLq0gdu3vHmyR9yhJbu1pESUyvkBnxDZAX1WGU3imGiUQizhU265kv8WQX7
         +RDzzmlr92dQwuS12mSMPoS3iuBNXTZfyhiLcFmhvJRDhdJy9SebJ0wDdSrET/9Jw2G3
         lmai8hpaoYCx+E70EsdueCyEMhWYS5ejuyuhcsA3ZeXirnH4Fx4IR/icc/dGSQD9c8Xd
         pcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myqzowoy6VgYIDOrHd/LfS2qrNQNfPA8OZoTCY9iRLs=;
        b=T7Rxcpl4PReio3hxbkNAntwmi19Ovhip3eJlOiqXmCUgdzDyUvvPNDlbuE07b/abj/
         yzv0epCP3WTOSNv7dRCNfcbETaiuckoTiFl3LQrlDuuEcti8CF/iQDNSZPcJpLZTjSX4
         +qPLMshk8sfxU8ICmWfWQUhkon24TOsYhg8ovUNYbLvee2uG2X7Uw2hPs/CzsNXr49TH
         fXMecHvd+WbjNfGxhF9EeNOPNMgBmTY0MCBFc1TtirPaug9oICnnG67NlBQQB5MfDT53
         erfAFUhLaDQjZYRAhOeTvin1XSPUd07N1VxxaWXQUbEfRUzXBy5VnUn1v4D0nSsimclR
         JhzA==
X-Gm-Message-State: AOAM5303aT/8vq264E9GIMBLl1z3+P89qUf7pxvDxU3ouwH+Z0LgtqtN
        6RfXfoYtFdkqn1AIVLmqoOqT7zDhPks7xv/47C8=
X-Google-Smtp-Source: ABdhPJxMFKzU0ZBFiuPaG5N/Xdix8OJOg9d03E2V2yUqffNnXenZz8yRtGFjZPojSKTDG6nnP4wBszblacn7FSeYifY=
X-Received: by 2002:a05:6402:291:: with SMTP id l17mr49109749edv.242.1637942539875;
 Fri, 26 Nov 2021 08:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20211115084203.56478-1-tony@atomide.com>
In-Reply-To: <20211115084203.56478-1-tony@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 18:01:43 +0200
Message-ID: <CAHp75VfzqvHY53hfKqub3WoT1Zm7vhXbwDTrbHOTMGnU7gcNEA@mail.gmail.com>
Subject: Re: [PATCHv4 0/7] Serial port generic PM to fix 8250 PM
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 15, 2021 at 10:43 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> Here are v4 patches for serial port generic PM. The scope has now expanded
> a bit from the earlier attempts to get rid of pm_runtime_irq_safe() for
> the 8250_omap driver. I've now picked up three patches from Andy's earlier
> generic serial port PM series.

Johan, do you have any objections / comments on the series? Otherwise
I think it's good to go next week next revision (as kbuild bot
complained about minor warning).

-- 
With Best Regards,
Andy Shevchenko
