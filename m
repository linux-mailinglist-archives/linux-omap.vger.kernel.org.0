Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5366C6EB7
	for <lists+linux-omap@lfdr.de>; Thu, 23 Mar 2023 18:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjCWRYJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Mar 2023 13:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjCWRYH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Mar 2023 13:24:07 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE9226CEF
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 10:23:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id eh3so89976380edb.11
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679592234;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDezs3zEjkvRanD33J6zrDyymFgFwmCyGJTYxM19XZA=;
        b=mQVRSW1yFnQ3n2LJfBiD6WAuuADS8/JjqbdqWmYJ4b+x6EO7obleiHEebzRRMRIDa1
         gL7G7cCM4L7RRwy4F83Keio3kacTSCrsW8+Z5UleyQxw69c6tHxQKtxRc335QTuVtwpM
         Xn5kXwD3eN+6iL/+Ts69yjLvHQre/6+oAJbmGTpIJJDeNe3L1/0zNxY4VS6+uWQzm8QW
         k/1nSV5EUYKLj1ubBzFBryq6tT7ivpfO8I3szfcpXyk9JqKuHZbB9BiLHOwWBNQ0dsKB
         lG+Q/Y5RmxQv9hQr42SUj66cnQHtNx0aQrelDzArMFosZKSErRUC33SP6LetK1LMthC/
         aF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592234;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDezs3zEjkvRanD33J6zrDyymFgFwmCyGJTYxM19XZA=;
        b=kGCeRzjWSp6WNUMEH4LhSsgmRvv34odGWSbeoPQsS174BerH/+jP6hOVvMlvCB/fah
         cQB0nzhBe/OJPUbxXxPIukpIykE0Omzr7D9JHTLoa7NirH3b/6Aq5+6ODi6GraOT0Kqe
         jFc0FuX3jUwuQlRBdFZ/Cib1yIQ6DRfuNw+JdjYJFpsaOk342bHFo0z4MHXzznsTqbxT
         JaDnBMyAN5TbPbUltTIJ91IjSRI1+ZezHltyrFSuTk3irnM75Lu3VTvfi48Q2B4rlCuR
         vc2lCZ3Tg6R+I7hmMGbTdD8rtzDboivmz5ffi11uv3Mk6IHTE7WB6kA1EveKwvWUa99o
         SE8w==
X-Gm-Message-State: AO0yUKV2SEXbZNEI30+wY/gWX2FCw7BNCGEbnB6L4FH4m0lQ51UKioIB
        +CJ9VNZn54HIb4rRyg1fc3eszGwY6kKlqy3u0sU=
X-Google-Smtp-Source: AK7set+jWYbPmsQ6iH7zqDbulZxDVB51AV7FBRV1XTVt4NDWn9Hnwi1IR6MBB5c+h8lrwKqusCfmURTT8q39tyeB+JI=
X-Received: by 2002:a17:906:7193:b0:87f:e5af:416e with SMTP id
 h19-20020a170906719300b0087fe5af416emr5850230ejk.7.1679592233724; Thu, 23 Mar
 2023 10:23:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:22:b0:4a:8724:8dcd with HTTP; Thu, 23 Mar 2023
 10:23:53 -0700 (PDT)
Reply-To: davisstaller225@gmail.com
From:   "Sgt. Lisa Davis" <drdavidnormannn@gmail.com>
Date:   Thu, 23 Mar 2023 17:23:53 +0000
Message-ID: <CAHXsS+4-1KhJW-G0EK0sLDGJz5AEHLsgCUmLeovYswvuQbB2OQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Dear, I am. Sgt. Lisa Davis, I am a US Special Force Team deployed
to Syria. I got interested in your profile. I would be pleased to keep
in touch with you and probably build trust among us with time.
