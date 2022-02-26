Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A604C52EB
	for <lists+linux-omap@lfdr.de>; Sat, 26 Feb 2022 02:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbiBZBFr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Feb 2022 20:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241085AbiBZBFr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Feb 2022 20:05:47 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903A221131F
        for <linux-omap@vger.kernel.org>; Fri, 25 Feb 2022 17:05:14 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id w7so8061652qvr.3
        for <linux-omap@vger.kernel.org>; Fri, 25 Feb 2022 17:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=DZAOxIqX5F2Y8N67F+UNLqR3zA6Clu1Nu25Jm7lUoWrYzlaI1q8NGIY6GnBG3/lPIH
         Dmrvq+jd1xt3rbukvJ9+t04rz0iqbxfn8x84wMVUAKQduM/llIA+99If9HbcQSlwfchb
         Xe48GZR0Ms7E5WRTH0s2DfQtIUAC/ALzv8ls3kEZe7T6tUr5zx+RDjUgKJ5bKGndx7kI
         BhGrziRx88dwaaBqDC1p2Csz/kyB8O0mR1vLzotRrlEugtOgOkhd4ytR9GPSTckJ+0vO
         vpIKJCybDbF6hjXTGK8lfzs5wtKxvtn9uXo4B3bKTaUSh6nRAuP5WekyByJOlGVqo1AX
         RnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=Rue9Z8i3/AUoP0JlSVj4SpB1sYgmmeV2eMMxqzpKBaMpc4Y0PeRALhnz/fca37S4Yc
         lVl+61HzGCf3gWWlnQxA2OE7etf7K1o3GiKI2U6DWIAxjEq7N7FKjJowoFCuvyY9/JE9
         whyBAiZYobmWwFHLdpDEFkPl4sqUlxniTiuXj47hF+2DfVA5HIJp6L7Inl0rl4mBiO7V
         IT0PYdB5xhI8/RCl+TY9T/MZGZMjDV+rL/pzFjumn068xYJtBIf5XtjRtRuYLhoiSHjn
         MxbW/mnw3foDMHmDxQvkNeoeUeg6Y8GAsNcU66JxTPZvsbbnPkOfjRtYr75Sj+hzKYGH
         P7Uw==
X-Gm-Message-State: AOAM532yF+8vjLElpTaxaDxjbjK0eJTILnsGQ/60hdzqH7/yFanhlIag
        mxyPA5pjGCh9Pwbt0u+mHl0prLhokAKObcgDQf8=
X-Google-Smtp-Source: ABdhPJxnprlDWjlXRTH73QpXEbIUaU51gHrlWQkj42EhvOEPWgbD2gPeVYasuKOB6HhtZNsVY8P8iR7c6G7vPrnAQVA=
X-Received: by 2002:a05:6214:1d24:b0:432:c4c6:98bb with SMTP id
 f4-20020a0562141d2400b00432c4c698bbmr3831436qvd.119.1645837513845; Fri, 25
 Feb 2022 17:05:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:d62:0:0:0:0 with HTTP; Fri, 25 Feb 2022 17:05:13
 -0800 (PST)
From:   Miss Reacheal <zemegnisse@gmail.com>
Date:   Sat, 26 Feb 2022 01:05:13 +0000
Message-ID: <CANkd_0zjOLtyZe4k-3s-N+aNcKEwRkN9cRi1uqfDzMURPaHXsQ@mail.gmail.com>
Subject: Re: Hello Dear, how are you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Reachal
