Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C670AEEFF
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 17:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730127AbfIJPvq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 11:51:46 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:35077 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbfIJPvq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 11:51:46 -0400
Received: by mail-io1-f51.google.com with SMTP id f4so37918951ion.2
        for <linux-omap@vger.kernel.org>; Tue, 10 Sep 2019 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yKGyvhlNDMC2zClhiiOj3MqIpC+SLegMEEDXmEmeAYg=;
        b=YW9AZaSoAJEHzsdZgUhU5KJGUzVgvfstmlfJEyZca5jFS8nXbQZfd8FGhmRtaj9ytI
         o5MQu9AAYEDR+HW8XpkF3DF+3mCUBbb9q+ynQ1h5YquBeZKes4RY1vQ97wt5Wh8gZZiD
         460xx4RsKrwnp0VPIdpEXs54ygPZedI/8G/ZE05g3ykqfFwcJQv+xoWUMLycqz5+xDdN
         VbXXJfdLRaz0CKNQJcyBdooqh/i/xgkNratLRqKR/3OTr3trcwbs2m9u4tfBmQbFLFFz
         TCct4DjMWQTeDoQjZYPLXSaGG47ItO0WeVbxn6dC70tHt7xBzxY+v6j3u0LRwOV3ncmb
         TinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yKGyvhlNDMC2zClhiiOj3MqIpC+SLegMEEDXmEmeAYg=;
        b=bVkeqaeoa8L5nwmI/T9USYNlRmvhoPG+LPZd3lqCS3R7wud70u9wqdR6rDVtD/Aujl
         MiLX0+wUvsuPzivVKzXEeckxL0CG+1qlKMcqcRZCPivD84720TmzRhexQDrDHYuspf3y
         Ts7zhpoBhNa0eIvpq7Zwd5lMrY/xS2hryPJtxZBc//I192ak12Gyy7PKFs0szQpd65h3
         QpBv76GGBaBJhiGrT4eaAUws9Y0NH9iNQ4pPAkmeEAzN2ePy5G0xMYso3C8oDc0cep8i
         A62+NavVfi4TsCKmiXt/7kDoT3cFz3Is5ossbFoxQgyIny7+AOP/bjZBPRImKrrpfilP
         j+Xw==
X-Gm-Message-State: APjAAAVJ89GJbQQoGCKAes6oe5E6A81Mnh5/35hmSuXDVPTu9BY8v1ub
        Sn59fr5IwYEtKbNacagBI63AgfypFs0IW/cvUCHgqCUM
X-Google-Smtp-Source: APXvYqyHqvwE3UEqSWoWm1iFAVA0QbcWB56M2k0w/dJTc4V4Pfom5fKbxd2Bwhq06/mjvHcKldbGw8RRHcbyDdGlqQI=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr8670373iof.158.1568130704706;
 Tue, 10 Sep 2019 08:51:44 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 10:51:33 -0500
Message-ID: <CAHCN7xKOZnqPx9jGJmyrdnZ94nemMf+t=SmZTOkeNHwL7echgw@mail.gmail.com>
Subject: omap2plus defconfig cleanup
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

I was going to update the omap2plus to some new modules.
However, when I do a make savedefconfig ARCH=arm, I get a bunch of
other stuff that either went away or moved around.  Are you ok if I do
a patch which just makes a clean  omap2plus_defconfig and then
re-saves it or would you want to do that?

This will make the additional module additions easier to manage.

thanks

adam
