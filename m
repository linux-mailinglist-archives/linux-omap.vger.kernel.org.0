Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAF64AA7EE
	for <lists+linux-omap@lfdr.de>; Sat,  5 Feb 2022 10:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356833AbiBEJjM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Feb 2022 04:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiBEJjL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Feb 2022 04:39:11 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EEDC061346
        for <linux-omap@vger.kernel.org>; Sat,  5 Feb 2022 01:39:10 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so7023072oth.3
        for <linux-omap@vger.kernel.org>; Sat, 05 Feb 2022 01:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Td5vD36TiCjrmgDeG21+ZYVTngfgrU7Rq+vEIdHqt/EZQOqWOZh2KTyHFub6RFXoiu
         9+UbRUGdquL3sKJhJpEhz4zYlFfdT07oKMNbadHqwX+JYrILvhp2YjPr7qEZVhGflSd7
         J+FacmRgHTibtR8V85okclaKUI/1y67sapbrIQbxe9srAhbBeXDlViUy2SOxXNk3Ajg0
         XjwmhzynxdCOlOGgdao2tWoxZFT4TeL7psoX5/S9IQbil39NI1E1kEoCxeZXG/JVhyE1
         PmjffyifABB2PqsLtY8wy3IXMAEYA9lRcQ9F50+EPomLqLmovQeFjGtVIPt0gdvtV1Xj
         KqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=53PP/0GmtkecR4tYndpVTXBfm6CzWanYlAwjnTOaSyOI3OSTVEubNPWrPnPBGaxQuS
         Vk/TzcWkXnTndBpGp2jCC/7xo6K0305MFXVOo4LJLXWy+UsyPvF6B80oJsjne0RSzal8
         GlIoCrOF4+qgMKCHRWfixYVN9JhgiaWtyi11xxrVeaf9WpNcN6RWWJzje3HQtDrh7Oaw
         9Hoj3M93BRjn4NM6J/uKrdTeDApDTIG/mHqamA85KkbBcvSQ70CxorHxPKFr3PSDQ355
         EuMKEELaWwkk+KhbY6VgX1Q1xzCTcU2SJX4MdfWLcp+8nkfVb1BsijmrMGXK9sllR9oU
         bm/A==
X-Gm-Message-State: AOAM532DeOriGkHNAdsP6RFqatshqoyeLmKnBcv0n4nIzbeaUpCnSyJo
        oI3W+VYN0uXC4Nkrryk0+tv7JXScvgQkhqd2/ys=
X-Google-Smtp-Source: ABdhPJz0MdtORPE9vmGcKSQxpep18cT9MTGaetgQc+kHyJwNKlWlkG4Jf1PFf9q3uMtKalFwsuzM+vbv5wC2Bnli1i0=
X-Received: by 2002:a05:6830:1d1:: with SMTP id r17mr954534ota.240.1644053949309;
 Sat, 05 Feb 2022 01:39:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6838:a5c2:0:0:0:0 with HTTP; Sat, 5 Feb 2022 01:39:08
 -0800 (PST)
Reply-To: mathewbowles2021@gmail.com
From:   Mathew Bowles <melaniegonzales2017@gmail.com>
Date:   Sat, 5 Feb 2022 09:39:08 +0000
Message-ID: <CAO8g-4vCsPHO_frJTUcaZ4BA4wNWcB-+Z2jGg1XjzkWQ7+z9yQ@mail.gmail.com>
Subject: Hello,Did you receive my email message
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


