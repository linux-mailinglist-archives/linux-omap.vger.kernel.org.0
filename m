Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8EB7D9EBB
	for <lists+linux-omap@lfdr.de>; Fri, 27 Oct 2023 19:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbjJ0RS1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Oct 2023 13:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbjJ0RSQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Oct 2023 13:18:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1254819A7
        for <linux-omap@vger.kernel.org>; Fri, 27 Oct 2023 10:17:01 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9adca291f99so344725466b.2
        for <linux-omap@vger.kernel.org>; Fri, 27 Oct 2023 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698427019; x=1699031819; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJZz0zbp619PkAsg5skGFWbIh3I2k8WqI80WgA8WsWk=;
        b=CU9DP7A0ozYkbaZnb6IiepDptXXFdP/Bdlan3UbBosgyDcbFRS+o11c1hlJ9YqN/Yj
         ZxgywA+6MLLPUpxRzpKA2F2VGI3UU/YO9Aw1FOprKDL7N3QbtVmLJ0GCpF7oN0F4jOgf
         ZRugCHCJ42Ykf2Deor58D1U4lWV6iq6kh/9vJf8kMmMxyo0ymhNOtNRetaTeutq3xlqt
         fnVj9BLVaTkMsaUh5ORtZf5oWme7E2ef2n/SF3eoXt5ff42eCc9VFDDokJAI8ONX6IxK
         gKnRC9MvwEmGJ6dhTls0HhdjNUEgCi/XOX2fucup3yx1jAjNrQoMGfarTmNuZRygZK5w
         tJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698427019; x=1699031819;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJZz0zbp619PkAsg5skGFWbIh3I2k8WqI80WgA8WsWk=;
        b=a5ETWbqBLARBre+cvoHnkKlnlZeqwgV6AYJ1NAqZLGppcK/IKVIGc4Hz67tNsDDuAW
         PktBS3aMxdsOK72g1vMQ+p6PMYl9sGhSLP+eHFbmo0H1E+A0+eTLmFx5LLtOZ8UWzlqH
         syHZsbSNv9vuN0BkfkhU6Xh3uND2r5hD8Tt17mP4vPTdWG8wvTU4H6scNhyTGPecXJay
         InFoTdjn1fObktgG7KUwP2x0Kvs+54Us5jlk6zGtV8fq2Yu2CHoZJ/4f+04/ZBTn22iX
         Taw++XSwdLsgYW6S8MMBhtStDyegNYPBt81uO+j1OfaxrCC9ZoCMQPnNaOoBqKknr24h
         4vAg==
X-Gm-Message-State: AOJu0YzrwsLrH3UbW5bnVC0AE0l0tw16YsWkCapqQ17+hpBEyEJdUNyu
        zXQcCPUyrY8a0wnDDAWGWkywCS3erCD8VBRWFWI=
X-Google-Smtp-Source: AGHT+IGiUee/bOH42fB4FekomSi4Ow+gx79fOez+k4ApcBi6kXOAoqvJEF1G8xV4GL93XaScvIwwmKDtwHYDbuAdS80=
X-Received: by 2002:a17:906:c103:b0:9c1:4343:60ab with SMTP id
 do3-20020a170906c10300b009c1434360abmr2811703ejc.10.1698427019241; Fri, 27
 Oct 2023 10:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9814:b0:9c2:3a5:9bd7 with HTTP; Fri, 27 Oct 2023
 10:16:58 -0700 (PDT)
Reply-To: liima_azevedo@hotmail.com
From:   "lima Azevedo ." <jmacdarmid1@gmail.com>
Date:   Fri, 27 Oct 2023 18:16:58 +0100
Message-ID: <CAFXhoP3uMC97QFOn2=Hd7Q1U0azO2TB7ZC7cc7o=pS95Vgk6wA@mail.gmail.com>
Subject: Hello....!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Hello ,

I have a business proposal for you ! If interested , reply me back for
more details .

Thank you.

lima Azevedo .
liima_azevedo@hotmail.com
